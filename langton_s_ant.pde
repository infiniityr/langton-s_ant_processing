final String PATTERN = "LLRR";

final int HEIGHT = 1024;
final int WIDTH = 1024;

final int CELL_SIZE = 2;

final int[][] GRID = new int[WIDTH/CELL_SIZE][HEIGHT/CELL_SIZE];

final int NUMBER_OF_MOVEMENTS_PER_ITERATIONS = 20000;

int[] colors;
String[] directions;

Ant ant;

void setup() {
  size(1024, 1024);
  noStroke();
  if (PATTERN == "LRL") {
    colors = new int[]{#cfd8dc, #002171, #000000};
    directions = new String[]{"left", "right", "left"};
  } else if(PATTERN == "LLRR") {
    colors = new int[]{#cfd8dc, #ff844c, #1976d2, #000000};
    directions = new String[]{"left", "left", "right", "right"};
  } else if (PATTERN == "RRLLLRLLLRRR") {
    colors = new int[]{#cfd8dc, #607d8b, #fb8c00, #43a047, #8e24aa, #9fa8da, #ffd54f, #870000, #ff844c, #1976d2, #18ffff, #000000};
    directions = new String[]{"right", "right", "left", "left", "left", "right", "left", "left", "left", "right", "right", "right"};
  } else if (PATTERN == "LRRRRRLLR") {
    colors = new int[]{#cfd8dc, #607d8b, #fb8c00, #ffd54f, #870000, #ff844c, #1976d2, #18ffff, #000000};
    directions = new String[]{"left", "right", "right", "right", "right", "right", "left", "left", "right"};
  } else if (PATTERN == "LLRRRLRLRLLR") {
    colors = new int[]{#cfd8dc, #607d8b, #fb8c00, #43a047, #8e24aa, #9fa8da, #ffd54f, #870000, #ff844c, #1976d2, #18ffff, #000000};
    directions = new String[]{"left", "left", "right", "right", "right", "left", "right", "left", "right", "left", "left", "right"};
  } else { //RL
    colors = new int[]{#cfd8dc, #000000};
    directions = new String[]{"right", "left"};
  }
  
  ant = new Ant(GRID.length/2, GRID[0].length/2);
  
}


void draw() {
  background(255);
  move(NUMBER_OF_MOVEMENTS_PER_ITERATIONS);
  
  for (int i = 0; i < GRID.length; i++) {
    for (int j = 0; j < GRID[i].length; j++) {
      fill(colors[GRID[i][j]]);
      rect(i*CELL_SIZE, j*CELL_SIZE, CELL_SIZE, CELL_SIZE);
    }
  }
}

void move(int nb_moves) {
  for (int i = 0; i < nb_moves; i++) {
    ant.move();
  }
}

class Ant {
  public int x;
  public int y;
  public int direction;
  
  public Ant() {
    this(50, 50);
  }
  
  public Ant(int x, int y) {
    this.x = x;
    this.y = y;
    this.direction = 0;
  }
  
  public void move() {
    GRID[this.x][this.y] = (GRID[this.x][this.y] + 1)%colors.length;
    switch (this.direction) {
      case 0:
        this.y = this.y-1>=0?this.y-1:HEIGHT/CELL_SIZE-1;
        break;
      case 1:
        this.x = (this.x+1)%(WIDTH/CELL_SIZE);
        break;
      case 2:
        this.y = (this.y+1)%(HEIGHT/CELL_SIZE);
        break;
      default:
        this.x = this.x-1>=0?this.x-1:WIDTH/CELL_SIZE-1;
    }
    if (directions[GRID[this.x][this.y]] == "right") {
      this.direction = (this.direction+1)%4;
    } else {
      this.direction = (this.direction-1 >= 0)?this.direction-1:3;
    }
  }
  
  
}
