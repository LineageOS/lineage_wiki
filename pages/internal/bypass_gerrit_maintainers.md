---
sidebar: home_sidebar
title: How to bypass Gerrit
folder: internal
permalink: bypassing_gerrit.html
search: exclude
tags:
 - internal
---

## Bypassing Gerrit

{% include alerts/note.html content="The following tips are for those few who have the ability to accept changes into Gerrit's official LineageOS repositories and/or who are able to bypass Gerrit entirely. Only posted here for convenience for these maintainers, in case anyone forgets the steps." %}
{% include alerts/warning.html content="To mass-submit to Gerrit, you will need the *Push* and *Create Reference* permissions. For mass pushes that include commits you didn't create yourself, you may also need *Forge Author* and *Forge Committer* permissions. If you believe you are lacking appropriate permissions, file a `DEVREL` ticket [here](https://gitlab.com/LineageOS/issues/devrel-int/issues)." %}

Say you have a bunch of changes and want to skip Gerrit's interface entirely, pushing directly to the repository. For this you will need special privileges.

This is a summary of the user-upload feature, described in detail [here](https://review.lineageos.org/Documentation/user-upload.html).

### Preparation

Start by syncing the repo:

```
repo sync
```

Branch the repository to anything. In the new branch, add your commits (or merge from another branch, git pull from AOSP, or whatever gets your changes in).
Next, enter `lineageremote`. This command will add the remote (use `git remote -v` to see it).

### To bypass Gerrit

{%- include snippets/branches.md %}

Assuming `lineage-{{ current_branch | precision: 1 }}` is the branch to which you are pushing, type:

```
git push lineage HEAD:refs/heads/lineage-{{ current_branch | precision: 1 }}
````

### To mass-push commits to Gerrit for review

Type the above mentioned command, but use `refs/for/branch` instead of `refs/heads/branch`.

### To create a new remote branch (on GitHub)

You can create a new (remote) branch by typing:

```
git push -u lineage HEAD:refs/heads/new-branch-name
```
