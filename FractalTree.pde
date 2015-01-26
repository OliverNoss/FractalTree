// Oliver Noss AP CompSci Block 4
private double fractionLength = .2; 
private int smallestBranch = 10; 
private double branchAngle = 1.1;  
private int r = 0;
private int g = 255;
private int num = 1;
private double leftAngle=.1;
private double rightAngle=.1;

public void setup() 
{   
	size(640,520);    
	noLoop(); 
} 
/*public void mouseClicked()
{
	if (mouseButton==LEFT)
		redraw();
	if (mouseButton==RIGHT)
		{
			fractionLength = .2;
			smallestBranch = 10;
			redraw();
		}
}*/
public void keyPressed()
{
	if (key==CODED)
	{
		if (keyCode==LEFT && num>1)
			num--;
		if (keyCode==RIGHT && num<5)
			num++;
		if (keyCode==UP)
		{
			if (num==1 && fractionLength<.75)
				fractionLength+=.05;
			if (num==2 && smallestBranch<30)
				smallestBranch++;
			if (num==3)
				branchAngle+=.05;
			if (num==4)
				leftAngle+=.1;
			if (num==5)
				rightAngle+=.1;

		}
		if (keyCode==DOWN)
		{
			if (num==1 && fractionLength>0)
				fractionLength-=.05;
			if (num==2 && smallestBranch>4)
				smallestBranch--;
			if (num==3 && branchAngle>0)
				branchAngle-=.05;
			if (num==4 && leftAngle>0)
				leftAngle-=.1;
			if (num==5 && rightAngle>0)
				rightAngle-=.1;
		}

	}
	if (key == '2')
	{
		fractionLength = .75; 
		smallestBranch = 5; 
		branchAngle = 1.6;  
		leftAngle=.2;
		rightAngle=.2;
	}
	if (key == '1')
	{
		fractionLength = .2; 
		smallestBranch = 10; 
		branchAngle = 1.1;  
		leftAngle=.1;
		rightAngle=.1;
	}
	redraw();
}
public void draw() 
{   
	background(0);
	stroke(0,100,255);
	fill(0,100,255);
	if (num==1)
		fill(255);
	text("fractionLength: " + (float)fractionLength, 10, 500);
	fill(0,100,255);
	if (num==2)
		fill(255);
	text("smallestBranch: " + smallestBranch, 150, 500);
	fill(0,100,255);
	if (num==3)
		fill(255);
	text("branchAngle: " + (float)branchAngle, 270, 500);
	fill(0,100,255);
	if (num==4)
		fill(255);
	text("leftAngle: " + (float)leftAngle, 420, 500);
	fill(0,100,255);
	if (num==5)
		fill(255);
	text("rightAngle: " + (float)rightAngle, 550, 500);
	noFill();
	strokeWeight(3);
	line(0,480,640,480);
	strokeWeight(1);
	stroke(r,g,0);
	line(320,480,320,380);
	drawBranches(320,380,100,3*Math.PI/2);  


} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle*rightAngle;
	double angle2 = angle - branchAngle*leftAngle;
	branchLength*=fractionLength;
	int x1,x2,y1,y2;
	x1 = (int)(branchLength*Math.cos(angle1) + x);
	y1 = (int)(branchLength*Math.sin(angle1) + y);
	x2 = (int)(branchLength*Math.cos(angle2) + x);
	y2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,x1,y1);
	line(x,y,x2,y2);
	if (branchLength>smallestBranch)
	{
		drawBranches(x1,y1,branchLength,angle1);
		drawBranches(x2,y2,branchLength,angle2);
	}
}