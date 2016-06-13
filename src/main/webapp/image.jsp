<%@ page contentType="image/jpeg"
	import="java.awt.*,
java.awt.image.*,java.util.*,javax.imageio.*" pageEncoding="utf-8"%>
<%!
Color getRandColor(int fc,int bc) {
    Random random = new Random();
    if(fc>255) fc=255;
    if(bc>255) bc=255;
    int r=fc+random.nextInt(bc-fc);
    int g=fc+random.nextInt(bc-fc);
    int b=fc+random.nextInt(bc-fc);
    return new Color(r,g,b);
}
%>
<%
out.clear();
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
int width=60, height=20;
//创建BufferedImage对象，设置图片的长度宽度和色彩
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//取得Graphics对象，用来绘制图片
Graphics g = image.getGraphics();
Random random = new Random();
//绘制图片背景和文字,释放Graphics对象所占用的资源
g.setColor(getRandColor(200,250));
//设置内容生成的位置
g.fillRect(0, 0, width, height);
//设置内容的字体和大小   
g.setFont(new Font("Times New Roman",Font.PLAIN,18));
//设置内容的颜色：主要为生成图片背景的线条
g.setColor(getRandColor(160,200));
//图片背景上随机生成155条线条，避免通过图片识别破解验证码 
for (int i=0;i<155;i++) {
    int x = random.nextInt(width);
    int y = random.nextInt(height);
    int xl = random.nextInt(12);
    int yl = random.nextInt(12);
    g.drawLine(x,y,x+xl,y+yl);
}
String sRand="";
for (int i=0;i<4;i++){
String rand=String.valueOf(random.nextInt(10));
sRand+=rand;
//设置写运算表达的颜色
g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
//在指定位置绘制指定内容（即运算表达式） 
g.drawString(rand,13*i+6,16);
}
// 将验证码存入SESSION
session.setAttribute("sRand",sRand);
//释放此图形的上下文以及它使用的所有系统资源，类似于关闭流   
g.dispose();
//通过ImageIO对象的write静态方法将图片输出
ImageIO.write(image, "JPEG", response.getOutputStream());
%>