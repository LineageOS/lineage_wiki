Enter the following to initialize the repository:

{% include alerts/note.html content="Make sure the branch you enter here is the one you wish to build!" %}

```
cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b {% if current_branch < 15 %}cm{% else %}lineage{% endif %}-{{ current_branch | precision: 1 }} --git-lfs
```

### Download the source code

To start the download of the source code to your computer, type the following:

```
repo sync
```

The LineageOS manifests include a sensible default configuration for repo, which we strongly suggest you use (i.e. don't add any options to sync).
For reference, our default values are `-j 4` and `-c`. The `-j 4` part implies be four simultaneous threads/connections. If you experience
problems syncing, you can lower this to `-j 3` or `-j 2`. On the other hand, `-c` makes repo to pull in only the current branch instead of all branches that are available on GitHub.

{% include alerts/note.html content="This may take a while, depending on your internet speed. Go and have a beer/coffee/tea/nap in the meantime!" %}

{% include alerts/tip.html content="The `repo sync` command is used to update the latest source code from LineageOS and Google. Remember it, as you may want to
do it every few days to keep your code base fresh and up-to-date. But note, if you make any changes, running `repo sync` may wipe them away!" %}
