#!/bin/sh -e
if [ ! -f debian/control ]
then
    echo "Run this script from the main repository directory," \
         "not from debian directory"
    exit 1
fi

version=$(git tag --points-at HEAD | sed 's/[^\.0-9]//g')
if [ -z "$version" ]
then
	version="0.0.0-$(git branch --show-current)"
fi
date=$(date -R)

cat <<EOF > debian/changelog
ovenmediaengine ($version) UNRELEASED; urgency=low

  * changelog is not implemented

 -- AirenSoft <contact@airensoft.com>  $date
EOF

dpkg-buildpackage -uc -us -b
