---
title: how to convert and edit videos
---

## convert webm to mp4

It will convert to `128kb/s`

```bash
ffmpeg -i input.webm -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 128k output.mp4
```

## remove from the middle

### Method1 (worked!)

[Ref](https://stackoverflow.com/questions/64866231/remove-a-section-from-the-middle-of-a-video-without-concat)

```bash
# will remove the 121 to 190 seconds from the full video
ffmpeg -i input.mp4 \
  -vf  "select='not(between(t,121,190))',  setpts=N/FRAME_RATE/TB" \
  -af "aselect='not(between(t,121,190))', asetpts=N/SR/TB" \
  output.mp4
```

### Method 2 (not tested)

```bash
ffmpeg -i input.mp4 -t "$start_cut_section" -c copy part1.mp4&
ffmpeg -i input.mp4 -ss "$end_cut_section" -c copy part2.mp4&
echo "file 'part1.mp4'" > filelist;
echo "file 'part2.mp4'" >> filelist;
wait;

ffmpeg -f concat -i filelist -c copy output.mp4;
rm filelist;
```

or
[Ref](https://askubuntu.com/questions/977162/how-to-remove-a-few-seconds-from-mp4-file-using-ffmpeg)

```bash
ffmpeg  -t 00:11:00 -i input.mp4 -map 0 -c copy segment1.mp4
ffmpeg -ss 00:11:10 -i input.mp4 -map 0 -c copy segment2.mp4

# put these in input.txt
file 'segment1.mp4'
file 'segment2.mp4'

ffmpeg -f concat -i input.txt -map 0 -c copy output.mp4
```

## trim (cut)

```bash
# time-based
ffmpeg -i input.mp4 -ss 00:02:01 -to 00:03:08 -c:v copy -c:a copy output.mp4

# duration-based
ffmpeg -i input.mp4 -ss 00:02:01 -t 67 -c:v copy -c:a copy output.mp4
```
