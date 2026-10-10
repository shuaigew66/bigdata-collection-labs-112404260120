# Lab 1：静态页面与 API 数据采集

平台：**SmartPark DataLab**（`https://115.159.159.82`）

## 目录结构

```text
lab01/
├── REPORT.md            # 实验报告（内容已填好，仅个人信息和 4 张截图待补）
├── lab1_html_api.ipynb  # 完整实验代码（已执行，含运行输出）
├── README.md            # 本文件
├── data/
│   ├── devices.json     # 5000 条设备记录
│   └── companies.json   # 60 条企业记录
└── images/              # 需要你自行截取的 4 张图放这里
    ├── 01_device_api.png
    ├── 02_company_source.png
    ├── 03_company_next.png
    └── 04_validation.png
```

## 环境依赖

```bash
pip install requests beautifulsoup4
```

站点证书有效，`requests` 默认校验即可通过。

## 采集结果

| 目标 | 加载方式 | 入口 | 结果 |
|---|---|---|---|
| Device | 动态加载（JSON API） | `GET /api/devices?page=N&page_size=50` | 5000 条，`device_id` 唯一 |
| Company | 静态加载（HTML） | `GET /companies?page=N` + CSS Selector | 3 页共 60 条，`company_id` 唯一 |

- Device：`total = 5000`，`page_size = 50` → 总页数 `100`（由接口返回值计算，未写死）
- Company：`article.company-card` → 每页 20 条；`nav.pagination a:last-of-type` → 下一页
- Company–Device 设备数量一致性检查：**不一致企业数 = 0**

## 还需要补的 4 张截图

所有截图统一放到 `images/` 目录，文件名必须与 `REPORT.md` 中一致：

| 文件名 | 界面要求 | 大致内容 |
|---|---|---|
| `01_device_api.png` | 浏览器 **DevTools → Network** | 选中返回设备列表的 `api/devices` 请求，右侧 Headers 可见 Request URL 与 Query 参数 |
| `02_company_source.png` | 浏览器**查看网页源代码** | `Ctrl + F` 搜到企业名，命中 `<article class="company-card">` |
| `03_company_next.png` | 浏览器 **DevTools → Elements** | 选中底部"下一页" `<a href="/companies?page=2">` |
| `04_validation.png` | **JupyterLab 运行结果** | 5 项校验指标同屏输出（60 / 60 / 5000 / 5000 / 0） |

> 注意：不能截整个桌面，也不要贴整份 Notebook 代码。

## GitHub 提交

将本目录作为仓库的 `lab01/` 提交即可，报告路径为 `lab01/REPORT.md`。
