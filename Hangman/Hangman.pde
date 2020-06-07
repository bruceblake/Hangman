import java.util.*;
String title = "Hangman!";
String wordText = "Enter the word:";
String word = "";
String entered = "";
boolean gameStarted = false;
boolean readyToDelete = false;
boolean readyToDrawLines = false;
int intWordLength = 0;
int wrongGuesses = 0;
char guessText = ' ';
int index = 0;
int letterSpacing = 1;
int[] alreadyUsedIndex;
boolean wonGame = false;
int numberCorrect = 0;
ArrayList<Character> correctAnswers;
void setup() {
  size(640, 480);
  background(255);

}

void keyPressed() {

  if (!gameStarted) {
    if (key == '\n') {
      gameStarted = true;
      readyToDelete = true;
      readyToDrawLines = true;
      intWordLength = wordLength();
      alreadyUsedIndex = new int[intWordLength];
      correctAnswers = new ArrayList<Character>();
      entered = word;
    } else {
      word = word + key;
    }
  } else {
    if (correctGuess(key)) {
      guessText = key;
      index = correctGuessIndex(key);
 
    }else{
      stroke(0);
      text(key,10 * letterSpacing,465);
      letterSpacing += 2;
     wrongGuesses++;
    drawStickman();
    }
      
    
    
  }
}

void drawStickman(){
  switch(wrongGuesses){
    case 1:
stroke(0);
     fill(255);
    ellipse(460,340,16,16);
    break;
   case 2:
      line(460, 350, 460, 375);
      break;
    case 3:
      line(460,375,445,405);
        break;
     case 4:
         line(460,375,475,405);
         break;
     case 5:
         line(440,360,460,360);
         break;
         
     case 6:
         line(460,360,480,360);
         background(255);
         stroke(0);
         text("The word was: " + entered, 185,230);
         break;
         
}
}

boolean correctGuess(char c) {
  for (char x : entered.toCharArray()) {
    if (c == x) {
      numberCorrect++;
      return true;
    } 
     
  }
  return false;
}
int correctGuessIndex(char c) {
int count = 0;
  for(int i =0;i<intWordLength;i++){
    if(c == entered.toCharArray()[i] && alreadyUsedIndex[i] != c){
      alreadyUsedIndex[i] = c;
      return count;
    }
    count++;
  }
  return count;
}

int wordLength() {
  int count = 0;
  for (int x : word.toCharArray()) {
    count++;
  }
  return count;
}



void draw() {
  fill(0);
    text(Character.toString(guessText),(40 * index) + 20, 150);
 
  if(gameStarted){
 if(numberCorrect == intWordLength){
   background(255);
   background(255);
  textSize(30);
  stroke(0);
  text("Congrats! You Won!",170,200);
  textSize(25);
  text("The word was: " + entered, 190, 250);
  }
  }
  
  textSize(35);
  stroke(0);
  fill(0);
  text(title, 220, 40); // this creates the title of the game
  


  if (!readyToDelete) {
    textSize(45);
    fill(0);
    text(wordText, 150, 240); //this creates the word length input screen
    textSize(25);
    fill(0);
    text(word, 290, 430); //this creates the text of the word length
  } else {
    wordText = "";
    word = "";
    background(255);
    readyToDelete = false;
  }




  if (readyToDrawLines) {
    fill(0);
    text("Guess the word!", 170, 100);
    for (int i =0; i<intWordLength; i++) {
      strokeWeight(4);
        line((40 * i) + 10, 160 , (40 * i) + 40, 160);
   
       
      
  }
  readyToDrawLines = false;

  if (gameStarted) {
    strokeWeight(2);
    stroke(0);
    line(500, 450, 600, 450);
    line(550, 450, 550, 320);
    line(550, 320, 460, 320);
    line(460, 320, 460, 340);  //draws the hangman stand
    
 

  }


  }
    
}




 
