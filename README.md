

## **3️⃣ Set Up the Local Development Environment**
Each member should clone the repository to their local system:

```bash
git clone https://github.com/your-username/BondTime.git
cd BondTime
```

Then, initialize and install dependencies:

```bash
flutter pub get
```

---

## **4️⃣ Create a Branching Strategy**
To maintain an organized workflow, follow these branching rules:

- **`main` branch**: Production-ready, stable code (Only you merge here).
- **`develop` branch**: Ongoing development (Team pushes here).
- **Feature branches**: Team members create feature branches and merge into `develop`.

Branch naming convention:

```bash
feature/<feature-name>  # for new features
bugfix/<issue-name>  # for fixing bugs
```

Example:
```bash
git checkout -b feature/login-screen
```

---

## **5️⃣ Push Changes & Open a Pull Request (PR)**
Each developer will:
1. **Work on their branch**, commit changes, and push to GitHub:

   ```bash
   git add .
   git commit -m "Added login screen UI"
   git push origin feature/login-screen
   ```

2. Go to GitHub, open the repository, and click **"Compare & pull request"**.
3. **Assign the PR to you** and add team members as reviewers.
4. You **review and merge** only if the code is correct.



## **7️⃣ Keeping the Repository Updated**
Before starting work, each developer should **pull the latest changes**:

```bash
git checkout develop
git pull origin develop
```

After merging a PR, delete the old branch:

```bash
git branch -d feature/login-screen
git push origin --delete feature/login-screen
```

---

## **8️⃣ Handling Merge Conflicts**
If there are conflicts, resolve them with:

```bash
git pull origin develop
git merge develop
```

Then manually fix conflicts, commit, and push again.

