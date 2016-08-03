package org.shell.mmo.sample.catan;

import com.google.common.base.Preconditions;
import org.shell.mmo.sample.message.proto.Global;

import javax.swing.*;
import java.awt.*;

/**
 * Created by zhangxiangxi on 16/7/29.
 */
public class CatanMapShow {
    private static MyFrame frame;

    public static void show(CatanMap catanMap) {
        frame = new MyFrame(catanMap);
    }

    public static void update() {
        frame.repaint();
    }

    public static class MyFrame extends JFrame {
        final MyPanel mp;
        public MyFrame(CatanMap catanMap) throws HeadlessException {
            mp = new MyPanel(catanMap);
            this.add(mp);

            this.setSize(1440, 1280);
            this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            this.setVisible(true);
        }
    }

    public static class MyPanel extends JPanel {
        final CatanMap catanMap;
        public MyPanel(CatanMap catanMap) {
            this.catanMap = catanMap;
        }

        @Override
        public void paint(Graphics g) {
            super.paint(g);

            int line = 120;
            double xv = line * (1 + Math.cos(Math.toRadians(60))) / 3;
            double yv = line * Math.sin(Math.toRadians(60)) / 3;
            int mapX = this.getWidth() / 2;
            int mapY = this.getHeight() / 2;

            // 绘制边(港口)
            for (CatanMap.CatanEdge edge : catanMap.getEdges().values()) {
                CatanMap.CatanPoint src = edge.getPoint1();
                CatanMap.CatanPoint dst = edge.getPoint2();

                int srcX = (short) (mapX + (src.getX() * xv));
                int srcY = (short) (mapY + (src.getY() * yv));

                int dstX = (short) (mapX + (dst.getX() * xv));
                int dstY = (short) (mapY + (dst.getY() * yv));

                int cX = (srcX + dstX) / 2;
                int cY = (srcY + dstY) / 2;

                Color color = catanMap.getColores().get(edge.getOwner());
                if (color != null) {
                    g.setColor(color);
                }
                g.drawLine(srcX, srcY, dstX, dstY);
                g.setColor(Color.black);

                if (edge.getType() != null) {
                    g.drawString(toString(edge.getType()), cX - 30, cY);
                }

            }

            // 绘制点(资源)
            for (CatanMap.CatanPoint point : catanMap.getPoints().values()) {
                if (point.getType() == null) {
                    continue;
                }
                Color color = catanMap.getColores().get(point.getOwner());
                g.setColor(color);
                int srcX = (short) (mapX + (point.getX() * xv));
                int srcY = (short) (mapY + (point.getY() * yv));
                if (point.getType() == CatanMap.CatanPoint.Type.CITY) {
                    g.fillRect(srcX - 5, srcY - 5, 10, 10);
                } else {
                    g.drawRect(srcX - 5, srcY - 5, 10, 10);
                }
                g.setColor(Color.BLACK);
//                int srcX = (short) (mapX + (point.getX() * xv));
//                int srcY = (short) (mapY + (point.getY() * yv));
//
//                g.setColor(Color.GREEN);
//                g.drawString(point.getResources() + "", srcX, srcY);
//                g.setColor(Color.BLACK);
            }

            // 绘制格子(资源,数字)
            for (CatanMap.CatanGrid grid : catanMap.getGrids().values()) {
                int x = (int) (mapX + grid.getX() * xv);
                int y = (int) (mapY + grid.getY() * yv);
                Preconditions.checkArgument((grid.getType() == null && grid.getNumber() == 0)
                        || (grid.getType() != null && grid.getNumber() != 0));
                // 绘制强盗
                if (grid == catanMap.getRobber()) {
                    g.setColor(Color.GRAY);
                    g.fillRect(x - 10, y - 10, 20, 20);
                    g.setColor(Color.BLACK);
                }

                if (grid.getType() != null) {
                    String str = toString(grid.getType()) + " " + grid.getNumber();
                    g.setColor(Color.BLUE);
                    g.drawString(str, x - 30, y);
                    g.setColor(Color.BLACK);
                }
            }
        }

        private String toString(Global.CatanResourceType type) {
            switch (type) {
                case RESOURCE_LUMBER:
                    return "木头";
                case RESOURCE_BRICK:
                    return "砖头";
                case RESOURCE_WOOL:
                    return "羊毛";
                case RESOURCE_GAIN:
                    return "粮食";
                case RESOURCE_ORE:
                    return "煤矿";
            }
            return null;
        }

        private String toString(Global.CatanPortType type) {
            switch (type) {
                case PORT_LUMBER:
                    return "木头港口";
                case PORT_BRICK:
                    return "砖头港口";
                case PORT_WOOL:
                    return "羊毛港口";
                case PORT_GAIN:
                    return "粮食港口";
                case PORT_ORE:
                    return "煤矿港口";
                case PORT_BANK:
                    return "3比1港口";
            }
            return null;
        }
    }
}