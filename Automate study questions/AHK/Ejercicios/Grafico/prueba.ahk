Gui, -Caption
Gui, font, s22

Gui, Add, Picture, x0 y0 gUImove, bar.png

Gui, Add, Picture, x720 y0 gclose +BackgroundTrans, but.png

Gui, Add, Picture, x0 y40, bg.png

Gui, Add, Text, x100 y220 +BackgroundFF9977, like
Gui, Add, Picture, x50 y250 +BackgroundTrans vc1 gClick, like.png
Gui, Add, Picture, x50 y250 +BackgroundTrans vc2 gClick hidden, dislike.png

Gui, Add, Text, x100 y120 +BackgroundFF9977, color
Gui, Add, Picture, x50 y150 +BackgroundTrans vy1 gClick2, like.png
Gui, Add, Picture, x50 y150 +BackgroundTrans vy2 gClick2 hidden, dislike.png

Gui, Add, Picture, x400 y85 +BackgroundTrans vx1, likeHand.png
Gui, Add, Picture, x400 y155 +BackgroundTrans vx2 hidden, dislikeHand.png

Gui, Add, Picture, x400 y85 +BackgroundTrans vx3 hidden, likeHandColor.png
Gui, Add, Picture, x400 y155 +BackgroundTrans vx4 hidden, dislikeHandColor.png

Gui, show, w760 h456

ci := 1, xi := 1, yi :=1, c:=3
return

UImove:
PostMessage, 0xA1, 2,,,A
return

close:
GuiEscape:
ExitApp

Click:
	GuiControl Hide, x%xi%
	GuiControl Hide, c%ci%
		ci := 3 - ci
		xi := c - xi
	GuiControl Show, x%xi%
	GuiControl Show, c%ci%
return

Click2:
	GuiControl Hide, x%xi%
	GuiControl Hide, y%yi%
		if (c==3){
			c:=7
			xi := xi + 2
		}else{
			c:=3
			xi := xi - 2
		}
		yi := 3 - yi
	GuiControl Show, x%xi%
	GuiControl Show, y%yi%
return