#!/bin/bash
version=`git symbolic-ref --short -q HEAD`
VERSION=${version/v}
# git clone -b ${VERSION} https://gitee.com/mirrors/Sentinel.git
git clone -b ${VERSION} https://github.com/alibaba/Sentinel.git
# git clone -b 1.7.2 https://github.com/alibaba/Sentinel.git
