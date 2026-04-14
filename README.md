# NAS Auto Backup & Retention Manager

[![Bash](https://img.shields.io/badge/Bash-4.0+-4EAA25?logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

**Solusi backup sederhana untuk NAS yang tidak memiliki fitur retention policy bawaan.**

## 📌 Latar Belakang

Banyak NAS (Network Attached Storage) menyediakan fitur backup dasar, namun kebanyakan **tidak memiliki**:

- ✅ Backup berdasarkan **tanggal** dalam struktur folder
- ✅ **Retention policy** (hapus otomatis backup lama)
- ✅ Fleksibilitas backup **daily** maupun **monthly**

Script ini hadir untuk mengisi kekosongan tersebut — **sederhana, ringan, dan sesuai kebutuhan**.

## ✨ Fitur Utama

| Fitur | Deskripsi |
|-------|------------|
| 📁 **Backup Berbasis Tanggal** | Folder otomatis dinamai `YYYY-MM-DD` untuk daily atau `YYYY-MM` untuk monthly |
| 🗑️ **Retention Policy** | Hapus folder backup yang sudah melebihi batas waktu (contoh: >3 bulan) |
| 🔧 **Mudah Dikustomisasi** | Ubah parameter seperti jumlah hari/bulan penyimpanan sesuai kebutuhan |
| 📋 **Logging** | Catat semua aktivitas backup & penghapusan untuk audit |
| ⏰ **Cron-Ready** | Jalankan otomatis setiap hari/bulan via scheduler |

## 🚀 Cara Kerja

```mermaid
graph LR
    A[Source Data] --> B[Script Backup]
    B --> C[Folder YYYY-MM-DD]
    C --> D[Retention Check]
    D -->|>3 bulan| E[Hapus Otomatis]
    D -->|<3 bulan| F[Pertahankan]

    
