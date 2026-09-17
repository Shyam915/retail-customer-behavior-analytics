# Publish to GitHub

1. Create a new public GitHub repository named:
   `retail-customer-behavior-analytics`
2. Upload all files from this folder.
3. Keep `README.md` at the repository root.
4. Do not upload passwords, API keys or database credentials.
5. Open the README and confirm the project structure renders correctly.
6. Add repository topics:
   `data-analytics`, `python`, `sql`, `power-bi`, `pandas`, `portfolio-project`

If you want to publish directly from your computer:
```bash
git init
git add .
git commit -m "Initial retail customer analytics portfolio project"
git branch -M main
git remote add origin YOUR_GITHUB_REPOSITORY_URL
git push -u origin main
```

Power BI note:
The `.pbix` file itself must be created/saved from Power BI Desktop. This package contains the complete dashboard specification, DAX measures, theme and a preview image so the dashboard can be reproduced without copying someone else's `.pbix`.
