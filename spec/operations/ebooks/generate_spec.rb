require 'rails_helper'

RSpec.describe Ebooks::Generate do
  let(:book) { create(:book, name: "Another Sample book") }
  let!(:article1) do
    create(:web_article, 
      title: "Sample title", 
      content: "<p>content<img src='images/FB-Jak-tworzyc-zarabiajace-produkty.png' /></p>", 
      url: "www.wp.pl",
      image_urls: "http://jakoszczedzacpieniadze.pl/wp-content/uploads/2017/05/FB-Jak-tworzyc-zarabiajace-produkty.png",
      book: book
      )
  end
  let!(:article2) do
    create(:web_article, 
      title: "Another article", 
      content: "<p>another content</p><p><img src='images/2-JS117202740-yana-two-face-cat-news-small_trans_NvBQzQNjv4Bq6OSVDLJdG-ypfVsRFKR-mLAGLIqw3-UGQfihKkRs-p8.jpg' /><img src='images/FB-edukacja-finansowa-dzieci.png' /></p>", 
      url: "www.profiart.pl",
      image_urls: "http://www.telegraph.co.uk/content/dam/pets/2017/01/06/2-JS117202740-yana-two-face-cat-news-small_trans_NvBQzQNjv4Bq6OSVDLJdG-ypfVsRFKR-mLAGLIqw3-UGQfihKkRs-p8.jpg;;;http://jakoszczedzacpieniadze.pl/wp-content/uploads/2017/06/FB-edukacja-finansowa-dzieci.png",
      book: book
      )
  end

  subject { described_class.new(book.reload).call }

  it "sends params", :focus do
    params = {
      ebook_draft: {
        book_id: 1,
        book_opf: "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
        "<package unique-identifier=\"uid\" xmlns:opf=\"http://www.idpf.org/2007/opf\" xmlns:asd=\"http://www.idpf.org/asdfaf\">\n" +
        "\t<metadata>\n" +
        "\t\t<dc-metadata  xmlns:dc=\"http://purl.org/metadata/dublin_core\" xmlns:oebpackage=\"http://openebook.org/namespaces/oeb-package/1.0/\">\n" +
        "\t\t\t<dc:Title>Another Sample book</dc:Title>\n" +
        "\t\t\t<dc:Language>en</dc:Language>\n" +
        "\t\t\t<dc:Creator>webook</dc:Creator>\n" +
        "\t\t\t<dc:Copyrights>webook</dc:Copyrights>\n" +
        "\t\t\t<dc:Publisher>webook</dc:Publisher>\n" +
        "\t\t\t<x-metadata>\n" +
        "\t\t\t\t<!-- <EmbeddedCover>images/cover.jpg</EmbeddedCover> -->\n" +
        "\t\t\t</x-metadata>\n" +
        "\t\t</dc-metadata>\n" +
        "\t</metadata>\n" +
        "\t<manifest>\n" +
        "\t\t<item id=\"content\" media-type=\"text/x-oeb1-document\" href=\"toc.html\"></item>\n" +
        "\t\t<item id=\"text\" media-type=\"text/x-oeb1-document\" href=\"text.html\"></item>\n" +
        "\t</manifest>\n" +
        "\t<spine toc=\"ncx\">\n" +
        "\t\t<itemref idref=\"content\"/>\n" +
        "\t\t<itemref idref=\"text\"/>\n" +
        "\t</spine>\n" +
        "\t<guide>\n" +
        "\t\t<reference type=\"toc\" title=\"Table of Contents\" href=\"toc.html\"/>\n" +
        "\t\t<reference type=\"text\" title=\"Book\" href=\"text.html\"/>\n" +
        "\t</guide>\n" +
        "</package>\n",
        text: "<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n<meta charset=\"UTF-8\">\n<title>Another Sample book</title>\n</head>\n<body>\n  <h2 id=\"1\">Sample title</h2>\n  <h4>www.wp.pl</h4>\n  <div><div>\n  <p>content<img src='images/FB-Jak-tworzyc-zarabiajace-produkty.png' /></p>\n  </div></div>\n  <h2 id=\"2\">Another article</h2>\n  <h4>www.profiart.pl</h4>\n  <div><div>\n  <p>another content</p><p><img src='images/2-JS117202740-yana-two-face-cat-news-small_trans_NvBQzQNjv4Bq6OSVDLJdG-ypfVsRFKR-mLAGLIqw3-UGQfihKkRs-p8.jpg' /><img src='images/FB-edukacja-finansowa-dzieci.png' /></p>\n  </div></div>\n</body>\n</html>\n",
        toc: "<!DOCTYPE html>\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n\t<meta charset=\"UTF-8\">\n\t<title>TOC</title>\n</head>\n<body>\n\t<h1 id=\"toc\">Spis treści</h1>\n\t<ul> \n      <li><a href=\"text.html#1\">Sample title</a></li> \n      <li><a href=\"text.html#2\">Another article</a></li> \n  </ul> \n</body>\n</html>\n",
        image_urls: [
          "http://jakoszczedzacpieniadze.pl/wp-content/uploads/2017/05/FB-Jak-tworzyc-zarabiajace-produkty.png",
          "http://www.telegraph.co.uk/content/dam/pets/2017/01/06/2-JS117202740-yana-two-face-cat-news-small_trans_NvBQzQNjv4Bq6OSVDLJdG-ypfVsRFKR-mLAGLIqw3-UGQfihKkRs-p8.jpg",
          "http://jakoszczedzacpieniadze.pl/wp-content/uploads/2017/06/FB-edukacja-finansowa-dzieci.png",
        ]
      }
    }
    response = double("response").as_null_object
    expect(RestClient).to receive(:post).with(/http/,params) { response }
    subject
  end

  it "returns url to download mobi" do
    expect(subject).to include(".mobi")
  end
end