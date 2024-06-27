---
title: step by stepe through an example
---

To upload a folder to Amazon S3 using `s3cmd`, you can use the `put` command with the `--recursive` option. This command will upload all files within the specified directory to the specified bucket. Here are the steps:

1. **Install `s3cmd`**: If you haven't installed `s3cmd` yet, you can do so by running the following command on your Linux system:

    ```bash
    sudo apt-get install s3cmd
    ```

2. **Configure `s3cmd`**: You need to configure `s3cmd` with your AWS access key and secret key. You can do this by running:

    ```bash
    s3cmd --configure
    ```

3. **Upload the folder**: Use the `put` command with the `--recursive` option to upload the folder and all its contents to the specified bucket:

    ```bash
    s3cmd put --recursive /path/to/local/folder s3://bucket-name/path/to/folder/
    ```

    - `/path/to/local/folder` is the directory you want to upload.
    - `s3://bucket-name/path/to/folder/` is the path in the bucket where you want to upload the folder.

4. **Optional flags**: You can add additional flags to customize the upload process. For example:
    - `--acl-public` sets the permissions to public.
    - `--add-header=Cache-Control:max-age=86400` sets the cache control header to 1 day.

    ```bash
    s3cmd put --recursive --acl-public --add-header=Cache-Control:max-age=86400 /path/to/local/folder s3://bucket-name/path/to/folder/
    ```

### Example Usage

Here is an example of uploading a folder named `dir1` from the local directory `/home/user` to the bucket `my.bucket` in the path `/assets/dir1/`:

```bash
s3cmd put --recursive --acl-public --add-header=Cache-Control:max-age=86400 /home/user/dir1 s3://my.bucket/assets/dir1/
```

### Additional Tips

- **Trailing Slash**: Ensure that the bucket path includes a trailing slash (`/`) to maintain the directory structure.
- **Recursive Upload**: The `--recursive` option ensures that all files within the specified directory are uploaded.
- **File Naming**: You can rename files during upload by specifying the new name at the end of the path.

### Troubleshooting

- **Existing Directory Structure**: If the directory structure already exists in the bucket, `s3cmd` will not overwrite the existing files. You can use the `sync` command to update the files if needed.
- **File Size and MD5 Check**: `s3cmd` performs a size and MD5 checksum comparison to ensure that the files are identical on both the local and remote sides.
