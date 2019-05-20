#!/bin/bash

#docker pull rdeboo/rmats:4.0.2-2
#docker image build -t hermes2014/docker-rmats:4.0.2-3 . | tee ./docker_image_build.log
#docker pull zavolab/rmats2sashimiplot:2.0.3

docker run -it --rm -v $(pwd):/data -w /data/testData/ hermes2014/docker-rmats:4.0.2-3 \
  python /root/software/rmats/rMATS-turbo-Linux-UCS4/rmats.py \
  --b1 b1.txt --b2 b2.txt \
  --gtf /data/gtf/Homo_sapiens.GRCh37.87.gtf \
  --od /data/output -t paired --readLength 101 --cstat 0.0001 --libType fr-unstranded 
<<COMMENT_rMATS
COMMENT_rMATS

docker run -it --rm -v $(pwd):/data hermes2014/rmats2sashimiplot:2.0.3 \
  /usr/local/bin/rmats2sashimiplot \
  --b1 /data/testData/231ESRP.25K.rep-1.bam,/data/testData/231ESRP.25K.rep-2.bam \
  --b2 /data/testData/231EV.25K.rep-1.bam,/data/testData/231EV.25K.rep-2.bam \
  -c 11:+:810233:811645:/data/gff3/Homo_sapiens.GRCh37.87.gff3 --l1 RPLP2 --l2 RPLP2 --exon_s 1 --intron_s 5 -o /data/output

<<COMMENT_rmats2sashimiplot
COMMENT_rmats2sashimiplot
