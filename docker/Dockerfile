
# 1. 베이스 R 이미지 (rocker)
FROM rocker/r-ver:4.5.0

# 2. 필수 시스템 라이브러리 설치
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    pandoc \
    && apt-get clean

# 3. 작업 디렉토리 설정
WORKDIR /project

# 4. 프로젝트 전체 복사 (패키지 코드 + renv.lock + report 등)
COPY . /project

# 5. 필요한 패키지 설치: renv 먼저 설치
RUN R -e "install.packages('renv')"

# 6. renv 복원 (의존 패키지 재현)
RUN R -e "renv::restore(confirm = FALSE)"

# 7. 패키지 빌드 및 설치
RUN R -e "devtools::install_local('/project')"

# 8. 실행할 entrypoint 설정
ENTRYPOINT ["Rscript", "docker/entrypoint.R"]
