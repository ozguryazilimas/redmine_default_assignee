# Default Assignee

Redmine iş kayıtlarında belirli bir 'durum' seçildiğinde atanan bölümünün eklenti ayarlarında belirtilmiş kullanıcı seçilecek şekilde değişmesini sağlar.

Genel Menüde Uygula seçeneği seçildiğinde genel menü ile iş durumu değiştirildiğinde (iş listesine sağ tıklanarak) işlerin atananı
ayarlanan kullanıcı olarak değiştirilir. Kullanıcının işlere atanabilir olması ayar yapan kullanıcının sorumluluğundadır.

Redmine 4.x sürümü ile uyumludur, Redmine 3.x sürümü ile kullanmak istiyorsanız redmine3 dalını kullanabilirsiniz.


## Kurulum

Veritabanı şemasının eklentiye uygun olarak ayarlandığından emin olunuz

```
RAILS_ENV=production bundle exec rake redmine:plugins:migrate
```

## Özellikleri

1. Öntanımlı ayar kaydedilebilir.
2. Her proje için etkin/pasif edilebilir.
3. Her proje için ayrı ayar kaydedilebilir.


## Ayarlar

* Proje bazlı eklenti ayarlarına yönetici hesabı ile proje seçildikten sonra /settings/plugin/redmine_default_assignee adresinden ulaşılabilir.
* Ayar ekranında 'durum'ların bir listesi görünür. Her bir 'durum'un karşısındaki menüden durumu seçince tetiklenecek kullanıcı seçilebilir.
* Tüm projeler için öntanımlı bir ayar yapılmak istenirse yönetici hesabı ile /administration/Plugins/redmine_default_assignee configure ile ‘durum’un karşısındaki menüden durum atananı seçilir.

Not: Bu eklentinin gözükmesi için projenin 'Ayarlar' bağlantısında bulunan ‘Modüller' sekmesinde ‘Default Assignee’ etkin olmalıdır.

