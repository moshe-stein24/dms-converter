# DMS Converter - Quick Deploy Guide

## In 5 Minutes

### 1. Create GitHub Repo
Visit https://github.com/new
- Name: `dms-converter`
- Public
- No README needed

### 2. Push Code (copy-paste these commands)
```bash
cd dms_converter

git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/dms-converter.git
git branch -M main
git push -u origin main
```

Replace `YOUR_USERNAME` with your actual GitHub username.

### 3. Enable GitHub Actions
1. Go to Settings tab in your repo
2. Click Actions (left sidebar)
3. Click General
4. Select "Allow all actions and reusable workflows"
5. Click Save

### 4. Create Release (this triggers builds)
```bash
git tag v1.0.0
git push origin v1.0.0
```

**Wait 5-10 minutes...**

GitHub Actions automatically builds for:
- ✅ Windows (EXE)
- ✅ macOS (APP)
- ✅ Linux (Binary)
- ✅ Android (APK)

### 5. Share
Your Releases page: https://github.com/YOUR_USERNAME/dms-converter/releases

Anyone can download and run - **no Flutter needed!**

---

## What Each File Does

| File | Purpose |
|------|---------|
| `lib/main.dart` | The app code (100% complete) |
| `pubspec.yaml` | Flutter dependencies |
| `.github/workflows/build.yml` | Automatic builds on GitHub |
| `README.md` | User guide with examples |
| `LICENSE` | MIT license (open source) |
| `DEPLOYMENT.md` | Full deployment instructions |
| `GITHUB_SETUP.md` | Detailed step-by-step guide |

---

## Workflow: Update & Release

### For Each New Version

```bash
# 1. Make changes to lib/main.dart
# 2. Test locally
flutter run

# 3. Commit changes
git add .
git commit -m "Add new feature"
git push origin main

# 4. Create release tag
git tag v1.1.0
git push origin v1.1.0

# 5. GitHub automatically builds
# Wait 5-10 minutes for builds to complete
# Release appears on Releases page!
```

---

## Version Numbers

- `v1.0.0` - First release
- `v1.0.1` - Bug fix
- `v1.1.0` - New features
- `v2.0.0` - Major changes

---

## Files Users Download

After you push a release tag:

📦 **dms-converter-windows-x64.zip** (120 MB)
- Extract and run `dms_converter.exe`

📦 **dms-converter-macos.zip** (150 MB)
- Extract and double-click `dms_converter.app`

📦 **dms-converter-linux-x64.zip** (100 MB)
- Extract and run `./dms_converter`
- May need: `sudo apt install libgtk-3-0 libblkid1`

📦 **dms-converter-android.apk** (90 MB)
- Install directly on Android phone

---

## Common Issues

❌ **Builds not running**
→ Check Actions are enabled (Settings → Actions → Allow all)

❌ **Build fails**
→ Check Actions tab → Workflow runs → View logs

❌ **Tag not created**
→ Run: `git tag -l` to see existing tags

❌ **Push rejected**
→ Ensure you did `git push origin main` before creating tag

---

## Help

**Read:** GITHUB_SETUP.md (detailed guide with screenshots)

**Read:** DEPLOYMENT.md (complete technical reference)

**Problem?** Check `.github/workflows/build.yml` exists and is correct

---

**That's all! You're ready to deploy.** 🚀
