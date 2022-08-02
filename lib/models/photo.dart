class Photo {
    int id;
    int albumId;
    String title;
    String url;
    String thumbnailUrl;

    Photo({ required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl });

    static Photo from(Map<String, dynamic> item) {
        return Photo(
            id: item['id'] ?? 0,
            albumId: item['albumId'] ?? 0,
            url: item['url'] ?? "",
            title: item['title'] ?? "",
            thumbnailUrl: item['thumbnailUrl'] ?? "",
        );
    }

    Map<String, dynamic> toMap() {
        return {
            "id": id,
            "albumId": albumId,
            "url": url,
            "title": title,
            "thumbnailUrl": thumbnailUrl,
        };
    }
}