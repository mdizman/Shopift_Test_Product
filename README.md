# hollypalm_case_app
Holly Palm Case App

Mehmet Dizman

## Version içeriği
Flutter 3.29.3 
Tools • Dart 3.7.2 • DevTools 2.42.3

## Derleme hatası çözümü
Proje derleme hatası almanız durumunda 
-- android dosyası içerisinden settings.gradle a giriş yap
--plugins id "com.android.application" version "8.x.x" apply false kendi sürümüne göre ayarla

## Apikey gizliliği
.env dosyası içerisinde APIKEY, STORE_LINK, PRODUCT_ID bulnmakta
proje kök dizinine .env dosyası oluştur. 
içeriğine 

APIKEY='00e75e3bfd60f9cbb0d4f357c372d2b0'
STORE_LINK='https://hollypalm-test.myshopify.com/api/2025-04/graphql.json'
PRODUCT_ID="gid://shopify/Product/8740231905517"
APPJSON='application/json'

bu dosyaları içeriğine yapıştır. 

Yapılmaması halinde veri çekme işlemi yapılamayacaktır.

## Dosya aktarımında key alanlarının paylaşılmasını engellemek amacıyla env kullanıldı