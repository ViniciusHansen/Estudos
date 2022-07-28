#include <bits/stdc++.h>
using namespace std;

int main() {

    while (true){

        int n;
        cin >> n;

        if (n == 0) {break;}

        char op;
        cin >> op;

        map<string, char> braile_pra_char;
        map<char, string> char_pra_braile;

        braile_pra_char["*....."] = '1';
        braile_pra_char["*.*..."] = '2';
        braile_pra_char["**...."] = '3';
        braile_pra_char["**.*.."] = '4';
        braile_pra_char["*..*.."] = '5';
        braile_pra_char["***..."] = '6';
        braile_pra_char["****.."] = '7';
        braile_pra_char["*.**.."] = '8';
        braile_pra_char[".**..."] = '9';
        braile_pra_char[".***.."] = '0';

        char_pra_braile['1'] = "*.....";
        char_pra_braile['2'] = "*.*...";
        char_pra_braile['3'] = "**....";
        char_pra_braile['4'] = "**.*..";
        char_pra_braile['5'] = "*..*..";
        char_pra_braile['6'] = "***...";
        char_pra_braile['7'] = "****..";
        char_pra_braile['8'] = "*.**..";
        char_pra_braile['9'] = ".**...";
        char_pra_braile['0'] = ".***..";

        if (op == 'B') {
            string v[n];
            for (int i = 0; i < n; i++) v[i] = "kkkkkk";
            for (int i = 0; i < 6; i += 2) {
                for (int j = 0; j < n; j++) {
                    cin >> v[j][0+i] >> v[j][1+i];
                }
            }

            char res[n];
            for (int i = 0; i < n; i++) res[i] = braile_pra_char[v[i]];

            for (int i = 0; i < n; i++) cout << res[i];
            cout << endl;

        }
        else if (op == 'S') {
            char v[n];
            for (int i = 0; i < n; i++) cin >> v[i];

            string res[n];
            for (int i = 0; i < n; i++) res[i] = char_pra_braile[v[i]];

            for (int i = 0; i < 6; i += 2) {
                for (int j = 0; j < n; j++) {
                    if (j != 0) cout << " ";
                    cout << res[j][0+i] << res[j][1+i];
                }
                cout << endl;
            }
    }

}
}
