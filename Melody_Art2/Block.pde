class Block {

  final int EROORSIZE = 15;
  public int[] one_music_block = {0, 50, 100, 150, 200, 250, 300, 350, 400, 450};
  public int[] two_music_block = {0, 500, 550, 600, 650, 700, 750, 800, 850, 900};
  public int switch_block;
  public int select_block;
  public String[] one_str = {"無", "ド", "レ", "ミ", "ファ", "ソ", "ラ", "シ", "犬", "猫"};
  public String[] two_str = {"無", "2ド", "2レ", "2ミ", "2ファ", "2ソ", "2ラ","2シ", "2犬", "2猫"};

  Block() {
  };

  //マウスクリックすると対応したblockを取得
  void get_musicBlock() {
    if (mousePressed == true) {
      for (int i = 0; i < one_music_block.length; i++) {
        if (abs(((i * f.BLOCKSIZE) + (60 * i) + ADJUST_X) - mouseX) < f.BLOCKSIZE/2 
          && abs((height - ADJUST_Y) - mouseY) < f.BLOCKSIZE/2) {
          select_block = i;
        }
      }
    }
    fill(255, 255, 255, 200);
    rect((select_block * f.BLOCKSIZE) + (60 * select_block) + ADJUST_X, height - ADJUST_Y, f.BLOCKSIZE, f.BLOCKSIZE);
    fill(255, 255, 255);
  }

  void switch_musicBlock() {
    if (mousePressed == true) {
      if (abs(600 - mouseX) < f.BLOCKSIZE / 2 && abs((height - 150) - mouseY) < f.BLOCKSIZE) {
        switch_block = 0;
      } else if (abs(800 - mouseX) < f.BLOCKSIZE / 2 && abs((height - 150) - mouseY) < f.BLOCKSIZE) {
        switch_block = 1;
      } else if (abs(1000 - mouseX) < f.BLOCKSIZE && abs((height - 150) - mouseY) < f.BLOCKSIZE /2) {
        switch_block = 2;
      }
    }
    fill(160, 49, 50, 200);
    switch(switch_block) {
    case 0:
      rect(600, height - 150, f.BLOCKSIZE, f.BLOCKSIZE);
      break;
    case 1:
      rect(800, height - 150, f.BLOCKSIZE, f.BLOCKSIZE * 2);
      break;
    case 2:
      rect(1000, height - 150, f.BLOCKSIZE * 2, f.BLOCKSIZE);
      break;
    }
  }

  //fieldにblockをセットする
  void set_musicBlock() {
    if (mousePressed == true) {
      for (int y = 0; y < f.SIZE; y++) {
        for (int x = 0; x < f.SIZE; x++) {
          if (abs((x * f.BLOCKSIZE + (width / 6)) - mouseX) < f.BLOCKSIZE/2
            && abs((y * f.BLOCKSIZE) + (height / 20) - mouseY) < f.BLOCKSIZE/2) {
            switch(switch_block) {
            case 0:
              f.field[y][x] = one_music_block[select_block];
              f.strField[y][x] = one_str[select_block];
              break;
            case 1:
              if (y  > 0) {
                f.field[y][x] = two_music_block[select_block];
                f.strField[y][x] = two_str[select_block];
                f.field[y - 1][x] = two_music_block[select_block];
                f.strField[y - 1][x] = two_str[select_block];
              }
              break;
            case 2:
              if (x + 1 < f.SIZE) {
                f.field[y][x] = two_music_block[select_block];
                f.strField[y][x] = two_str[select_block];
                f.field[y][x + 1] = two_music_block[select_block];
                f.strField[y][x + 1] = two_str[select_block];
              }
              break;
            }
          }
        }
      }
    }
  }

  //blockの色を決める,実際の値には誤差があるためif文で記入
  void get_blockColor(int _value) {
    if (one_music_block[0] - EROORSIZE < _value && _value < one_music_block[0] + EROORSIZE) {
      fill(255, 255, 255);       //白
    } else if (one_music_block[1] - EROORSIZE < _value && _value < one_music_block[1] + EROORSIZE) {
      fill(255, 0, 0);     //赤
    } else if (one_music_block[2] - EROORSIZE < _value && _value < one_music_block[2] + EROORSIZE) {
      fill(255, 0, 119);   //ピンク
    } else if (one_music_block[3] - EROORSIZE < _value && _value < one_music_block[3] + EROORSIZE) {
      fill(137, 15, 101);  //紫
    } else if (one_music_block[4] - EROORSIZE < _value && _value < one_music_block[4] + EROORSIZE) {
      fill(0, 255, 0);     //青
    } else if (one_music_block[5] - EROORSIZE < _value && _value < one_music_block[5] + EROORSIZE) {
      fill(0, 0, 255);     //緑
    } else if (one_music_block[6] - EROORSIZE < _value && _value < one_music_block[6] + EROORSIZE) {
      fill(255, 255, 0);   //黄色
    } else if (one_music_block[7] - EROORSIZE < _value && _value < one_music_block[7] + EROORSIZE) {
      fill(255, 140, 0);   //橙
    } else if (one_music_block[8] - EROORSIZE < _value && _value < one_music_block[8] + EROORSIZE) {
      fill(0, 255, 255);
    } else if (one_music_block[9] - EROORSIZE < _value && _value < one_music_block[9] + EROORSIZE) {
      fill(34, 139, 34);
    }
  }
}