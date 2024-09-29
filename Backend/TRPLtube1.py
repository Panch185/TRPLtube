import pandas as pd
import random
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans

# Загрузка данных из Parquet файлов
dataset1 = pd.read_parquet('E:/ооп/pythonProject/logs_df_2024-07-17.parquet')  # содержит "video_id", "watchtime"
dataset2 = pd.read_parquet('E:/ооп/pythonProject/video_stat.parquet')  # содержит "title", "description"


def calculate_popularity(watchtime):
    if watchtime > 300:
        return watchtime > 0.25 * watchtime
    else:
        return watchtime > 30


while True:
    selected_video_ids = random.sample(dataset1['video_id'].tolist(), 10)
    selected_watchtimes = dataset1[dataset1['video_id'].isin(selected_video_ids)]['watchtime']

    # Фильтрация наиболее просматриваемых video_id
    popular_video_ids = [
                            vid for vid, watchtime in zip(selected_video_ids, selected_watchtimes) if
                            calculate_popularity(watchtime)
                        ][:10]

    # Извлечение информации
    results = dataset2[dataset2['video_id'].isin(popular_video_ids)][['title', 'description']]
    print(results)

    # Пользовательская бинарная классификация
    classifications = [int(input(f'Оставить video_id {vid}? (1 - да, 0 - нет): ')) for vid in popular_video_ids]

    # Фильтрация по классификации
    selected_video_ids = [vid for vid, classify in zip(popular_video_ids, classifications) if classify == 1]

    if not selected_video_ids:
        print("Нет выбранных video_id.")
        break

    # Кластеризация
    filtered_data = dataset2[dataset2['video_id'].isin(selected_video_ids)][['title', 'description']]
    vectorizer = TfidfVectorizer()
    tfidf_matrix = vectorizer.fit_transform(filtered_data['title'] + " " + filtered_data['description'])

    # Применение KMeans
    num_clusters = min(len(selected_video_ids), 5)  # Max 5 кластеров
    kmeans = KMeans(n_clusters=num_clusters)
    kmeans.fit(tfidf_matrix)

    # Вывод кластеризованных video_id
    for cluster_num in range(num_clusters):
        cluster_indices = [i for i, label in enumerate(kmeans.labels_) if label == cluster_num]
        cluster_video_ids = filtered_data.iloc[cluster_indices]
        print(f"\nCluster {cluster_num + 1}:")
        print(cluster_video_ids)