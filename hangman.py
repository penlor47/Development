# Hangman Game
## Just something a little fun I wrote to remind myself od basic python commands


def hangman(word):
    wrong = 0
    stages = ["", "______", "|______", "|", "| / \\", "| /|\\", "|  O", "|  |", " ___"]
    wletters = list(word)
    board = ["__ "] * len(word)
    gindx = []
    guessed = []
    level = ["","","","","","",""]
    while wrong < 13-1:
        guess = input("Guess a Letter:\n")
        correct = 0
        lost = 0
        for (indx,char) in enumerate(wletters):
            if guess in char:
                gindx.append(indx)
                correct = 1
                for idx in gindx:
                    board[idx]=wletters[idx]
        if correct == 0:
            print("Nope")
            wrong+=1
            guessed.append(guess)
            if wrong == 1:
                level[6] = stages[wrong]
            elif wrong == 2:
                level[6] = stages[wrong]
            elif wrong == 3:
                level[5] = stages[wrong]
            elif wrong == 4:
                level[4] = stages[3]
            elif wrong == 5:
                level[3] = stages[3]
            elif wrong == 6:
                level[2] = stages[3]
            elif wrong == 7:
                level[1] = stages[3]
            elif wrong == 8:
                level[0] = stages[8]
            elif wrong == 9:
                level[1] = stages[7]
            elif wrong == 10:
                level[2] = stages[6]
            elif wrong == 11:
                level[3] = stages[5]
            elif wrong == 12:
                level[4] = stages[4] 
            elif wrong == 13:
                level[5] = stages[3]                   
        for i in level:
            print(i)
        print("")
        print(guessed)
        print("")
        print(board)
        print("")
        if wrong == 12:
            print("You lost the word was: " + word)
        if board == wletters:
            print("You got the word, brilliant.")
            break
        

print("Welcome to Hangman")
hangman("george")