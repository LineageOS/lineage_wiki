## Common commands

{% if page.tags contains "gerrit" %}

### `repo`

*  `repo abandon <branch name>` to abandon any changes (commits) that have not been uploaded.

*  `repo start <branch> <project>` to start repo listening for changes through git.

*  `repo upload <project name>` to upload committed changes to the remote review server.

{% endif %}

### `git`

*  `git add <file name>` to stage a file that has been changed or added.

*  `git commit -m "comment"` to commit a change.

*  `git reset HEAD <file name>` to unstage a file.

*  `git revert HEAD` to undo the last commit.

*  `git status` to see the status of a project.

### `git subcommands`

*  `--date="DATE"` to specify the date of change if necessary. DATE has to be in RFC 2822, ISO 8601 or git internal time format.

   Examples:

     *  RFC 2822: Wed, 17 Jan 2018 17:39:48 +0100

     *  ISO 8601: 2018-01-17T17:39:48+0100

     *  git internal format: 1516210788 +0100


* `--author="NAME <EMAIL>"` to name the author if you did not write the patch yourself.

* `--amend` to modify the last commit.

## Resources

[Git Immersion](http://gitimmersion.com/)

[Git and repo overview](https://source.android.com/source/developing)

[Gerrit Documentation](https://review.lineageos.org/Documentation/index.html)
