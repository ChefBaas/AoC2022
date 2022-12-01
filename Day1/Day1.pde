String[] input;
IntList caloriesPerElf = new IntList();
int elfIndex = 0;
IntList highestTotals = new IntList();
int currentElfTotal = 0;
int topX = 3;
int step = 0;
int colorRange = 260;
float colorStart = 0.0f;

void setup()
{
    size(800, 800);
    input = loadStrings("InputDay1.txt");

    for (int i = 0; i < topX; i++)
    {
        highestTotals.set(i, 0);
    }

    caloriesPerElf.set(elfIndex, 0);
    noStroke();
    colorMode(HSB, colorRange);
}

int lastX = 0;
void draw()
{
    if (input[step].length() == 0)
    {
        newElf();
    } 
    else
    {
        int calories = int(input[step]);
        fill((colorStart * colorRange + elfIndex) % colorRange, colorRange, colorRange);
        rect(lastX, elfIndex * 3, calories / 200, 3);
        currentElfTotal += calories;
        lastX += (calories /  200);
    }
    step++;
    if (step == input.length - 1)
    {
        noLoop();
        endOfDay1();
    }
}

void endOfDay1()
{
    int totalCalories = 0;
    for (int i = 0; i < highestTotals.size(); i++)
    {
        totalCalories += highestTotals.get(i);
    }
    println(totalCalories);
}

void newElf()
{
    caloriesPerElf.set(elfIndex, currentElfTotal);
    checkReplaceHighest();
    elfIndex++;
    caloriesPerElf.set(elfIndex, 0);
    currentElfTotal = 0;
    lastX = 0;
}


void checkReplaceHighest()
{
    int lowestHighestIndex = 0;
    for (int i = 1; i < highestTotals.size(); i++)
    {
        if (highestTotals.get(i) < highestTotals.get(lowestHighestIndex))
        {
            lowestHighestIndex = i;
        }
    }
    if (highestTotals.get(lowestHighestIndex) < currentElfTotal)
    {
        highestTotals.set(lowestHighestIndex, currentElfTotal);
    }
}
