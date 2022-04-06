# install-CNS11643-fonts-action
在 Github Action 執行時安裝 [CNS11643 全字庫字型](https://data.gov.tw/dataset/5961)，以利環境有正確的中文字型可用

## 需求
* Ubuntu runner（已測試完成）

## 使用方式
### 簡易設定
最基本的設定方式：
```yaml
steps:
  - uses:  hms5232/install-CNS11643-fonts-action@v0  # 依照需求設定版本號或是 SHA
```

此方式會安裝正楷體及正宋體。

### 指定安裝字型
如果想指定要安裝的字型：
```yaml
steps:
  - uses:  hms5232/install-CNS11643-fonts-action@v0  # 依照需求設定版本號或是 SHA
    with:
      kai: 'true'  # 正楷體
      sung: 'true'  # 正宋體
```
※由於 Github action 的問題，目前還不支援輸入布林值，故請使用字串！詳見：[actions/runner#1483](https://github.com/actions/runner/issues/1483)

### 進階設定建議
細節請見各項設定的後方說明：
```yaml
steps:
  - uses:  hms5232/install-CNS11643-fonts-action@v0  # 依照需求設定版本號或是 SHA
    with:
      kai: 'true'  # 正楷體
      sung: 'true'  # 正宋體
    timeout-minutes: 10  # 因為是即時下載，為避免因為伺服器問題卡住流程或耗盡額度，建議設定一個執行時限。此範例為十分鐘
  # 下一個步驟
  - name: your next step
    if: always()  # 避免字型安裝失敗導致中斷流程
```

## 緣起
先前在 Github Action 上執行一些測試時，偶然發現和 local 執行的結果不同。一查發現原來是在 runner 環境中沒有中文字型的關係，所以所有中文字的部分都變成了方框。上網找了半天也沒找到有比較快的解法，就使用之前寫過的快速安裝 shell 手稿，在開始測試之前先執行安裝就解決了。

雖然這個需求只要不要在 runner 中使用中文，換成英文就好了。但畢竟有一個解法在那邊，就想說動手做成一個可以重複使用的 composite action 給大家使用吧！如果也有出現和我相同需求的人，就可以省下時間去研究安裝中文字型的時間（另外還有很多人忽略的，很多字型都不是免費或是可以合法在這種狀況下使用的）結果就是在你們眼前的 repo，希望在這個問題上可以幫上忙。

## 額外說明
* https://github.com/hms5232/ubuntu-install-CNS11643-fonts
  * 流程執行的 shell script 大致出自這邊
  * 如果是 PC 或伺服器環境需要，可使用此 repo 永久安裝於裝置上

## 授權
Copyright © 2022 hms5232

本項目使用 [Apache 2.0 開源許可證](LICENSE)；而 CNS11643 相關使用規範請依照[〈政府資料開放授權條款〉](https://data.gov.tw/license)相關規定。
