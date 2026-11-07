# Week 1: Git and GitHub

## Hours
- Learn 1
- Learn 2
- Build 1
- Build 2
- Review 1

## What I learned (in my own words)
This week I learned that Git is a tool for saving versions of my work. Each commit creates a snapshot, which lets me go back to earlier versions if I need to. I also learned that GitHub is the online platform where repositories are stored and shared, so teams can work together and keep backups online.

I practiced creating a repository, adding files, committing changes, and looking at git history. I learned how branches let me work on separate features without affecting main. I also learned how merge conflicts happen when two branches change the same line, and how to resolve them by keeping the correct final version.

## What confused me, and how I solved it
At first, I was confused by the difference between git add and git commit. I solved it by remembering that git add chooses the changes to save, while git commit creates the snapshot. I also had trouble with GitHub authentication at first, but I fixed it by creating the correct repository and using a personal access token instead of my password.

## Interview answers
1. git add vs git commit:
   git add selects the files to include in the next commit, while git commit saves that staged change as a new snapshot.

2. Branch:
   A branch is a separate line of work. Teams use branches to develop features independently before merging them into main.

3. Merge conflict:
   A merge conflict happens when two branches change the same line differently. To fix it, open the file, choose the correct final content, remove the conflict markers, then add and commit the result.

4. Merge vs rebase:
   git merge combines branches while preserving history, while git rebase rewrites the commit history. You should not rebase shared history that other people already have.

5. Good commit message:
   A good commit message explains what changed and why. Example: Add classes list.

6. Git vs GitHub:
   Git is the version control system used locally on my computer. GitHub is the online hosting service where repositories are shared and collaborated on.

## Check result
Week 1 practice: all checks PASS
