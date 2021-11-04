#include <bits/stdc++.h>

using namespace std;


struct nave{
    int x, y, z;
};

double dist(nave n1, nave n2){

    double d = sqrt(pow((n2.x - n1.x),2)+pow((n2.y - n1.y),2)+pow((n2.z - n1.z),2));
    return d;
}

int main() {

    int N, d;
    cin >> N;
    nave coords[N];
    for(int i = 0; i < N; i++){
        cin >> coords[i].x >> coords[i].y >> coords[i].z;
    }

    double dist_mais_perto[N];
    for(int i = 0; i < N; i++){
        dist_mais_perto[i] = 1e35; // 100000000000000000000000000000000000
        for(int j = 0; j < N; j++) if(i != j){
            double d = dist(coords[i], coords[j]);
            dist_mais_perto[i] = min(dist_mais_perto[i], d);
        }
    }

    for(int i = 0; i < N; i++){
        if(dist_mais_perto[i] <= 20) cout << 'A' << endl;
        else if (dist_mais_perto[i] > 20 && dist_mais_perto[i] <= 50) cout << 'M' << endl;
        else cout << 'B' << endl;
    }

    return 0;
}

