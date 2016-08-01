package org.shell.mmo.sample.catan;

import com.google.common.base.Preconditions;
import com.shell.mmo.utils.ExcelUtil;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.poi.ss.usermodel.Sheet;
import org.shell.mmo.sample.config.ConfigGroup;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.util.Map;

/**
 * Created by zhangxiangxi on 16/7/29.
 */
public class CatanMapTest {
    public static void main(String[] args) throws Exception {
        Pair<Map<String, Sheet>, Map<String, Sheet>> pair = ExcelUtil.parse(new File("/Users/zhangxiangxi/IdeaProjects/mmo-sample/share/config"));
        ConfigGroup configGroup = new ConfigGroup(ConfigGroup.create(pair.getLeft(), pair.getRight()));
        CatanMap catanMap = new CatanMap(configGroup.catanMapContainer.getList().get(0));

        show(catanMap);
    }

    private static void show(CatanMap catanMap) {
        new MyFrame(catanMap);
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

    static class MyPanel extends JPanel {
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

                g.drawLine(srcX, srcY, dstX, dstY);
                String str = edge.getGrids().size() + ":" + (edge.getType() == null ? "" : edge.getType().toString());

                g.setColor(Color.RED);
                g.drawString(str, cX - 50, cY);
                g.setColor(Color.BLACK);
            }

            // 绘制点(资源)
            for (CatanMap.CatanPoint point : catanMap.getPoints().values()) {
                int srcX = (short) (mapX + (point.getX() * xv));
                int srcY = (short) (mapY + (point.getY() * yv));

                g.setColor(Color.GREEN);
                g.drawString(point.getResources() + "", srcX, srcY);
                g.setColor(Color.BLACK);
            }

            // 绘制格子(资源,数字)
            for (CatanMap.CatanGrid grid : catanMap.getGrids().values()) {
                int x = (int) (mapX + grid.getX() * xv);
                int y = (int) (mapY + grid.getY() * yv);
                Preconditions.checkArgument((grid.getType() == null && grid.getNumber() == 0)
                        || (grid.getType() != null && grid.getNumber() != 0));
                if (grid.getType() != null) {
                    String str = grid.getType().toString() + "," + grid.getNumber();
                    g.setColor(Color.BLUE);
                    g.drawString(str, x - 50, y);
                    g.setColor(Color.BLACK);
                }
            }
        }
    }
}