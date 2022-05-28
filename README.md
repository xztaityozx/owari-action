# owari-action

[![CI](https://github.com/xztaityozx/owari-action/actions/workflows/ci.yaml/badge.svg)](https://github.com/xztaityozx/owari-action/actions/workflows/ci.yaml)

```

      owari-action
-------------------------
  制作・著作 xztaityozx

```

[xztaityozx/owari](https://github.com/xztaityozx/owari)を実行するactionです。

## 使い方

```yaml
steps:
  - uses: xztaityozx/owari-action@v1
    id: owari
    with:
      # trueのとき、owariの出力をjobのSummaryとして出力します
      # サンプル：https://github.com/xztaityozx/owari-action/actions/runs/2401448893/attempts/1#summary-6637632724
      as-summary: false

      # owariコマンドへの引数です
      args: 'default -a ${{github.repository}}'

    # `content` にowariコマンドの出力が格納されているので、後のstepでも使えます
  - run: echo ${{steps.owari.outputs.content}}
```

[.github/workflows/ci.yaml](./.github/workflows/ci.yaml)の `example` jobも参考にどうぞ。

## ライセンス
[MIT](./LICENSE)
