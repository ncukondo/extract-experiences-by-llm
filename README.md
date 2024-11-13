# Extract Experience by Large Language Model

## Description

This project is designed to extract experiences using a large language model.

### API

The entry point for the API is [api/index.ts](api/index.ts). The schema is described in OpenAPI format in [api/docs/extract-experiences.api.yaml](api/docs/extract-experiences.api.yaml).

#### API Development

It is developed using bun v1.0.25. The deployment server is Vercel. To install dependencies:

```bash
bun install
```

### Analysis

By comparing experiences automatically extracted using AI with those extracted by humans, we evaluate the extraction accuracy of the AI. The code for analyzing the extracted experiences is included in [analysis/analysis.r](analysis/analysis.r). The extracted experiences are contained in [analysis/data/](analysis/data/).

#### Data

| File Name | Description |
| --- | --- |
| [data.csv](analysis/data/data.csv) | Extracted experiences. The `prediction` column contains the IDs of experiences extracted by AI, and the `actual_by_student` column contains the IDs of experiences that medical students actually considered experiencing, separated by commas. |
| [all-ids.csv](analysis/data/all-ids.csv) | List of candidate experience IDs |
