#!/bin/bash

PARENT_DIR="/volume3/Monthly_backup/"

MONTHS_TO_KEEP=3             # Jumlah bulan penyimpanan

# Hitung tanggal 3 bulan yang lalu dalam format YYYY-MM-DD
THREE_MONTHS_AGO=$(date -d "-$MONTHS_TO_KEEP months" +%Y-%m-%d)

# Konversi ke timestamp Unix untuk perbandingan
THREE_MONTHS_AGO_TS=$(date -d "$THREE_MONTHS_AGO" +%s)

echo "Menghapus folder lebih lama dari $THREE_MONTHS_AGO ($MONTHS_TO_KEEP bulan)..."

# cek folder
ls -l "$PARENT_DIR"

for folder in "$PARENT_DIR"/*; do
    if [[ -d "$folder" ]]; then
        # Ekstrak nama folder (tanpa path)
        folder_name=$(basename "$folder")
        
        # Cek apakah nama folder sesuai format YYYY-MM-DD
        if [[ "$folder_name" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
            # Konversi nama folder ke timestamp Unix
            folder_ts=$(date -d "$folder_name" +%s 2>/dev/null)
            
            if [[ -n "$folder_ts" && "$folder_ts" -lt "$THREE_MONTHS_AGO_TS" ]]; then
                echo "Menghapus folder lama: $folder_name"
                rm -rf "$folder"  # Hapus folder beserta isinya
            fi
        else
            echo "Skip: Format nama folder tidak valid ($folder_name)"
        fi
    fi
done

echo "Pembersihan selesai!"
