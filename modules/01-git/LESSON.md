# Module 01: Git and GitHub (Week 1)

## Why this matters

Every software job uses Git. It saves snapshots of your work, called **commits**, so you can go
back in time. It also lets many people change the same code without overwriting each other.
Interviewers often ask: "What is a branch?", "What is the difference between merge and rebase?"
and "How do you fix a merge conflict?"

## The four places your code lives

```
working folder  --git add-->  staging area  --git commit-->  local repository  --git push-->  GitHub
```

- **Working folder:** the files you edit.
- **Staging area:** the changes you have chosen for the next snapshot.
- **Local repository:** all snapshots, kept in the hidden `.git` folder on your computer.
- **GitHub:** a copy online, which you share and use as a backup.

## Session Learn 1 (2 hours): your first commits

Run these in WSL, one by one. Read the output of each command before running the next.

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
mkdir -p ~/practice/git-week1 && cd ~/practice/git-week1
git init -b main
echo "# My practice" > README.md
git status                # README.md is "untracked"
git add README.md
git status                # now it is "to be committed"
git commit -m "Add README"
git log --oneline         # your first snapshot
```

**Exercise 1.** Create `students.txt` with three made-up names, one per line. Commit it with the
message `Add students list`.

**Exercise 2.** Add a fourth name. Before committing, run `git diff` and explain what the `+`
line means. Then commit with the message `Add fourth student`.

**Exercise 3.** Run `git log --oneline`. You should see 3 commits. Run `git show HEAD~1` and
explain what `HEAD~1` means.

## Session Learn 2 (2 hours): branches and conflicts

A **branch** is a separate line of work. GPIS used the branch `claude/admiring-darwin-it7fi1`
for changes, and only then moved them to `main`.

```bash
git switch -c add-classes            # new branch
echo "Basic 1" > classes.txt
git add classes.txt && git commit -m "Add classes"
git switch main                      # classes.txt disappears
git merge add-classes                # now it is on main too
```

**Exercise 4: make a conflict on purpose.**
1. On a new branch `rename`, change the first name in `students.txt` and commit.
2. Go back to `main`, change the **same line** to something else, and commit.
3. Run `git merge rename`. Git stops and marks the conflict with `<<<<<<<`, `=======` and
   `>>>>>>>`.
4. Edit the file to keep the line you want, delete the markers, then
   `git add students.txt && git commit`.

**Exercise 5.** Run `git log --oneline --graph --all` and draw the picture on paper.

## Check your work

From this course folder:

```bash
bash modules/01-git/checks/check.sh ~/practice/git-week1
```

All lines must say `PASS`.

## Build sessions (6 hours): put this course on GitHub

1. Create the public repository `se-course` on github.com (no README).
2. Unzip this course into `~/se-course` and, inside it, run:
   ```bash
   git init -b main
   git add .
   git commit -m "Start software engineering course"
   git remote add origin https://github.com/<you>/se-course.git
   git push -u origin main
   ```
   If GitHub asks for a password, it wants a **personal access token**, not your password.
   Learning to create one is part of this week.
3. Make one commit a day this week. Write your journal entry in `journal/week-01.md` and
   commit it.
4. **GitHub skill:** open an Issue called "Week 2: HTML" in your repository. Create a branch
   `week-02` and open a Pull Request from it to `main` when Week 2 is done. Real teams work
   this way.

## See it in GPIS (Review session)

In the GPIS repository, run `git log --oneline | head -20`. Look at the messages, such as
`D-247: a name typed in any order finds the student`. Notice that each one says **what**
changed and **why**. That is the habit to copy.

## Interview questions

Answer each one out loud in 1 minute, then write it in your journal.

1. What is the difference between `git add` and `git commit`?
2. What is a branch, and why would a team use one?
3. What causes a merge conflict? Walk me through fixing one.
4. What is the difference between `git merge` and `git rebase`? When should you not rebase?
   (Hint: never rewrite history other people already have.)
5. What makes a good commit message?
6. What is the difference between Git and GitHub?
