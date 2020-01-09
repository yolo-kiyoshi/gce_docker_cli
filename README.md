
# 概要

1. GCRにDockerイメージをpush
1. GCRのイメージからGCE上のVMにコンテナをdeploy
1. コンテナ処理終了後、VMを削除

# 前提

- MacあるいはLinuxであること
- Dockerをインストールしていること
- `gcloud` をインストールしていること

## VM起動パラメータ
`.param.sample` を複製し、 `.param` を作成する。
VM起動パラメータを `.param` に記載する。

```
SERVICE_ACCOUNT=*********
PROJECT_ID=*********
MACHINE_TYPE=n1-standard-1
```

## Credentialファイル
`Dockerfile` と同一ディレクトリにCredentialファイル(json)を配置する。

## コンテナ環境変数
`.env.sample` を複製し、 `.env` を作成する。
コンテナ環境変数を `.env` に記載する。
Credentialファイル(json)pathを必ず `GOOGLE_APPLICATION_CREDENTIALS` に記載する。

```
GOOGLE_APPLICATION_CREDENTIALS=/app/************.json
```

# Dockerイメージのビルド & GCRへのプッシュ

```
sh scripts/build_and_push.sh <イメージ名> <タグ>
```

# VMへのデプロイ

```
sh scripts/deploy_container.sh <サービス名> <イメージ名> <タグ>
```