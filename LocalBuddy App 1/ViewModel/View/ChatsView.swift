import SwiftUI
import CloudKit

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let recipient: String
    let timestamp: Date
    let content: String

    init(sender: String, recipient: String, timestamp: Date, content: String) {
        self.sender = sender
        self.recipient = recipient
        self.timestamp = timestamp
        self.content = content
    }

    init?(record: CKRecord) {
        guard
            let sender = record["sender"] as? String,
            let recipient = record["recipient"] as? String,
            let timestamp = record["timestamp"] as? Date,
            let content = record["content"] as? String
        else {
            return nil
        }

        self.sender = sender
        self.recipient = recipient
        self.timestamp = timestamp
        self.content = content
    }
    
    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: "Message")
        record["sender"] = sender as CKRecordValue
        record["recipient"] = recipient as CKRecordValue
        record["timestamp"] = timestamp as CKRecordValue
        record["content"] = content as CKRecordValue
        return record
    }
}

struct ChatBubble: View {
    let message: Message
    let isSentByMe: Bool
    @State private var isTimestampVisible = false

    var body: some View {
        HStack {
            if !isSentByMe {
                Spacer()
            }

            VStack(alignment: isSentByMe ? .trailing : .leading) {
                Text(message.content)
                    .padding()
                    .background(isSentByMe ? Color.black : Color(hex: "E9E9EB"))
                    .foregroundColor(isSentByMe ? .white : .black)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .onTapGesture {
                        isTimestampVisible.toggle()
                    }

                if isTimestampVisible {
                    Text(message.timestamp, style: .time)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 2)
                }
            }

            if isSentByMe {
                Spacer()
            }
        }
    }
}

struct ChatView: View {
    @State private var newMessage: String = ""
    @State private var messages: [Message] = [
        Message(sender: "John", recipient: "Me", timestamp: Date(), content: "Hey, how's it going, can I join your activty ?"),
     
        
    ]

    var body: some View {
        VStack {
           HStack {
              ZStack {
                 Circle()
                    .fill(Color.mustard)
                    .frame(width: 100, height: 50)
                 Image("circleimage")
                    .resizable()
                    .padding()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
              }
              VStack{Text("Emily Smith")
                    .font(.title)
                    .bold()
                 
                 Text("Online")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                 
              }
           } .offset(x: /*@START_MENU_TOKEN@*/-48.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
           

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages) { message in
                        ChatBubble(message: message, isSentByMe: message.sender == "Me")
                    }
                }
                .padding()
            }
           

            HStack {
                TextField("Type a message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: sendMessage) {
                    Text("Send")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding(.trailing)
            }
            .padding(.bottom)
        }

    }

    private func sendMessage() {
        guard !newMessage.isEmpty else { return }
        
            let sentMessage = Message(sender: "Me", recipient: "John", timestamp: Date(), content: newMessage)
            messages.append(sentMessage)
            
            let record = CKRecord(recordType: "Message")
            record["sender"] = sentMessage.sender
            record["recipient"] = sentMessage.recipient
            record["timestamp"] = sentMessage.timestamp
            record["content"] = sentMessage.content
            
            let container = CKContainer.default()
            let database = container.publicCloudDatabase
            
            database.save(record) { (record, error) in
                if let error = error {
                    print("Error saving message: \(error.localizedDescription)")
                } else {
                    print("Message saved successfully!")
                }
            }
            
            newMessage = ""
        }
        
    }


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

struct ChatsView: View {
    var body: some View {
        NavigationView {
            ChatView()
        }
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
       ChatView()
    }
}
