#!/bin/bash

# Add local user developer
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9097}
GROUP_ID=${LOCAL_GROUP_ID:-9097}

echo "Starting with Group ID: $GROUP_ID"
groupadd -g ${GROUP_ID} datascience
echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -l -u $USER_ID -g datascience -o -c "" -m developer



# execute with gosu to "get rid" of root
gosu developer mkdir -p $VIRTUAL_ENV
gosu developer virtualenv $VIRTUAL_ENV
gosu developer echo $PATH

# install basic modules
gosu developer pip install numpy \
                           pandas \
                           ipython \
                           jupyter \
                           jupyterlab \
                           scipy \
                           dscred \
                           boto3 \
                           scikit-learn \
                           psycopg2-binary \
                           XlsxWriter \
                           seaborn \
                           s3fs

