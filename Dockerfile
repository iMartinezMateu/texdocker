################## Set the base image to Debian
FROM debian:8

################## File Author / Maintainer
MAINTAINER Iván Martínez Mateu <imm@ivanmartinezmateu.com>

################## Install full TeX Live package 
RUN apt-get update && apt-get install -y texlive-full gnuplot python-pygments uuid-runtime

################## Add LaTeX compilation bash script to container
ADD latex-job.sh /
RUN chmod +x /latex-job.sh

################## Set shared volume to transfer all document external elements like images to the compiler
VOLUME "/tmp"
ENTRYPOINT /latex-job.sh -

