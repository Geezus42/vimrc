### Description of Changes
Closes #    <!-- Enter the issue number this PR addresses. If none, remove this line. -->


---
### New Version Info

- [ ] Update [CHANGELOG.md](https://github.com/scrooloose/nerdtree/blob/master/CHANGELOG.md), following this format/example:
    ```
    #### MAJOR.MINOR...
    - **.PATCH**: PR Title (Author) [#PR Number](link to PR)

    #### 5.1...
    - **.1**: Update Changelog and create PR Template (PhilRunninger) [#1007](https://github.com/scrooloose/nerdtree/pull/1007)
    - **.0**: Too many changes for one patch...
    ```
=======
#### Author's Instructions
- [ ] Derive a new `MAJOR.MINOR.PATCH` version number. Increment the:
    - `MAJOR` version when you make incompatible API changes
    - `MINOR` version when you add functionality in a backwards-compatible manner
    - `PATCH` version when you make backwards-compatible bug fixes
- [ ] Update [CHANGELOG.md](https://github.com/scrooloose/nerdtree/blob/master/CHANGELOG.md), following the established pattern.
#### Collaborator's Instructions
- [ ] Review [CHANGELOG.md](https://github.com/scrooloose/nerdtree/blob/master/CHANGELOG.md), suggesting a different version number if necessary.
<<<<<<< HEAD
- [ ] After merge, tag the merge commit, e.g. `git tag -a 3.1.4 -m "v3.1.4" && git push origin --tags`
<<<<<<< HEAD
=======
>>>>>>> 27ad0d07862847896f691309a544a206783c94d6
=======
- [ ] After merging, tag the commit using these (Mac-compatible) bash commands:
    ```bash
    git checkout master
    git pull
    sed -n "$(grep -n -m2 '####' CHANGELOG.md | cut -f1 -d: | sed 'N;s/\n/,/')p" CHANGELOG.md | sed '$d'
    git tag -a $(read -p "Tag Name: " tag;echo $tag) -m"$(git show --quiet --pretty=%s)";git push origin --tags
    ```
>>>>>>> master
>>>>>>> master
