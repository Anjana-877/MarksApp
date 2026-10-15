import SwiftUI

struct ContentView: View {
    @State private var students: [Student] = []
    @State private var studentName = ""
    @State private var markText = ""
    
    private var passedStudentsCount: Int {
        students.filter { $0.passed }.count
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Input Interface Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Add New Student")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    TextField("Student Name", text: $studentName)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                    
                    TextField("Mark (0 - 100)", text: $markText)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    
                    Button(action: addStudent) {
                        Text("Add Student")
                            .bold()
                            .frame(maxWidth: .infinity) // Fixed here: .infinity
                            .padding(.vertical, 12)
                            .background(Color.accentColor)
                            .foregroundStyle(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                
                // Real-time counter status banner
                HStack {
                    Label("Passed Students:", systemImage: "checkmark.seal.fill")
                        .font(.headline)
                    Text("\(passedStudentsCount)")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(passedStudentsCount > 0 ? .green : .secondary)
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                
                Divider()
                
                // Student List
                List(students) { student in
                    NavigationLink(destination: StudentDetailView(student: student)) {
                        HStack {
                            Text(student.name)
                                .font(.body)
                                .bold()
                            
                            Spacer()
                            
                            HStack(spacing: 8) {
                                Text("\(student.mark)")
                                    .bold()
                                Image(systemName: student.passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                            }
                            .foregroundStyle(student.passed ? .green : .red)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("SE4041 Marks")
        }
    }
    
    private func addStudent() {
        guard !studentName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        guard let mark = Int(markText) else { return }
        guard mark >= 0 && mark <= 100 else { return }
        
        let student = Student(name: studentName, mark: mark)
        students.append(student)
        
        studentName = ""
        markText = ""
    }
}

#Preview {
    ContentView()
}
