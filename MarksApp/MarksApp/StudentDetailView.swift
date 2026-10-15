import SwiftUI

struct StudentDetailView: View {
    let student: Student
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(Color.accentColor) // Fixed here: Color.accentColor
                .padding(.top, 40)
            
            Text(student.name)
                .font(.system(size: 36, weight: .bold, design: .rounded))
            
            VStack(spacing: 12) {
                HStack {
                    Text("Mark Assigned:")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("\(student.mark) / 100")
                        .bold()
                }
                
                Divider()
                
                HStack {
                    Text("Calculated Grade:")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(student.grade)
                        .bold()
                        .font(.title3)
                }
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal)
            
            HStack {
                Image(systemName: student.passed ? "checkmark.shield.fill" : "exclamationmark.shield.fill")
                Text(student.passed ? "PASS" : "FAIL")
                    .font(.title2)
                    .bold()
            }
            .foregroundStyle(.white)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity) // Fixed here: .infinity
            .background(student.passed ? Color.green : Color.red)
            .cornerRadius(12)
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("Student Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
