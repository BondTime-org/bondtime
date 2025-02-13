Set Up the Local Development Environment
Each member should clone the repository to their local system:

bash
Copy
Edit
git clone https://github.com/your-username/BondTime.git
cd BondTime
Then, initialize and install dependencies:

bash
Copy
Edit
flutter pub get
4️⃣ Create a Branching Strategy
To maintain an organized workflow, follow these branching rules:

main branch: Production-ready, stable code (Only you merge here).
develop branch: Ongoing development (Team pushes here).
Feature branches: Team members create feature branches and merge into develop.
Branch naming convention:

bash
Copy
Edit
feature/<feature-name>  # for new features
bugfix/<issue-name>  # for fixing bugs
Example:

bash
Copy
Edit
git checkout -b feature/login-screen
5️⃣ Push Changes & Open a Pull Request (PR)
Each developer will:

Work on their branch, commit changes, and push to GitHub:

bash
Copy
Edit
git add .
git commit -m "Added login screen UI"
git push origin feature/login-screen
Go to GitHub, open the repository, and click "Compare & pull request".

Assign the PR to you and add team members as reviewers.

You review and merge only if the code is correct.
