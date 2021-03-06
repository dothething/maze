// void mouseClicked() {
//   dots.add(new Dot(mouseX, mouseY));
//   println("LOC LIST BEGINS...");
//   for (int i=dots.size()-1; i>=0; i--) {
//     Dot dot = dots.get(i);
//     print(dot.x);
//     print(",");
//     println(dot.y);
//   }
//   println("...LOC LIST ENDS");
// }

PVector[] dotLocations = {
  new PVector(638.0,398.0),
  new PVector(650.0,418.0),
  new PVector(669.0,402.0),
  new PVector(669.0,383.0),
  new PVector(657.0,366.0),
  new PVector(635.0,360.0),
  new PVector(614.0,374.0),
  new PVector(604.0,399.0),
  new PVector(585.0,414.0),
  new PVector(568.0,406.0),
  new PVector(568.0,382.0),
  new PVector(575.0,362.0),
  new PVector(592.0,344.0),
  new PVector(615.0,331.0),
  new PVector(644.0,328.0),
  new PVector(674.0,335.0),
  new PVector(696.0,360.0),
  new PVector(707.0,389.0),
  new PVector(706.0,416.0),
  new PVector(687.0,440.0),
  new PVector(654.0,451.0),
  new PVector(632.0,468.0),
  new PVector(603.0,469.0),
  new PVector(653.0,488.0),
  new PVector(684.0,481.0),
  new PVector(715.0,462.0),
  new PVector(733.0,442.0),
  new PVector(743.0,403.0),
  new PVector(739.0,360.0),
  new PVector(719.0,327.0),
  new PVector(702.0,311.0),
  new PVector(673.0,295.0),
  new PVector(640.0,289.0),
  new PVector(607.0,293.0),
  new PVector(576.0,309.0),
  new PVector(550.0,332.0),
  new PVector(534.0,357.0),
  new PVector(524.0,393.0),
  new PVector(534.0,421.0),
  new PVector(551.0,440.0),
  new PVector(586.0,452.0),
  new PVector(584.0,488.0),
  new PVector(537.0,476.0),
  new PVector(516.0,457.0),
  new PVector(501.0,443.0),
  new PVector(493.0,412.0),
  new PVector(497.0,366.0),
  new PVector(510.0,329.0),
  new PVector(533.0,299.0),
  new PVector(564.0,268.0),
  new PVector(613.0,257.0),
  new PVector(680.0,258.0),
  new PVector(725.0,284.0),
  new PVector(754.0,312.0),
  new PVector(773.0,353.0),
  new PVector(780.0,409.0),
  new PVector(767.0,456.0),
  new PVector(750.0,484.0),
  new PVector(719.0,507.0),
  new PVector(657.0,523.0),
  new PVector(662.0,559.0),
  new PVector(730.0,543.0),
  new PVector(771.0,513.0),
  new PVector(801.0,474.0),
  new PVector(816.0,413.0),
  new PVector(809.0,346.0),
  new PVector(783.0,290.0),
  new PVector(748.0,251.0),
  new PVector(688.0,224.0),
  new PVector(610.0,220.0),
  new PVector(551.0,242.0),
  new PVector(507.0,272.0),
  new PVector(478.0,309.0),
  new PVector(460.0,359.0),
  new PVector(455.0,418.0),
  new PVector(470.0,457.0),
  new PVector(490.0,484.0),
  new PVector(522.0,509.0),
  new PVector(581.0,523.0),
  new PVector(577.0,561.0),
  new PVector(513.0,546.0),
  new PVector(472.0,518.0),
  new PVector(443.0,480.0),
  new PVector(425.0,433.0),
  new PVector(424.0,357.0),
  new PVector(444.0,296.0),
  new PVector(481.0,248.0),
  new PVector(535.0,208.0),
  new PVector(605.0,183.0),
  new PVector(698.0,189.0),
  new PVector(768.0,223.0),
  new PVector(813.0,268.0),
  new PVector(846.0,339.0),
  new PVector(855.0,415.0),
  new PVector(834.0,490.0),
  new PVector(793.0,543.0),
  new PVector(742.0,577.0),
  new PVector(662.0,598.0),
  new PVector(668.0,633.0),
  new PVector(754.0,615.0),
  new PVector(819.0,568.0),
  new PVector(865.0,500.0),
  new PVector(889.0,418.0),
  new PVector(878.0,327.0),
  new PVector(839.0,248.0),
  new PVector(787.0,192.0),
  new PVector(700.0,150.0),
  new PVector(599.0,146.0),
  new PVector(520.0,171.0),
  new PVector(454.0,217.0),
  new PVector(410.0,279.0),
  new PVector(384.0,355.0),
  new PVector(387.0,442.0),
  new PVector(410.0,500.0),
  new PVector(448.0,544.0),
  new PVector(502.0,581.0),
  new PVector(573.0,599.0),
  new PVector(569.0,635.0),
  new PVector(490.0,614.0),
  new PVector(427.0,574.0),
  new PVector(379.0,518.0),
  new PVector(352.0,450.0),
  new PVector(352.0,350.0),
  new PVector(378.0,265.0),
  new PVector(430.0,195.0),
  new PVector(501.0,140.0),
  new PVector(591.0,112.0),
  new PVector(703.0,113.0),
  new PVector(805.0,162.0),
  new PVector(874.0,227.0),
  new PVector(914.0,317.0),
  new PVector(929.0,418.0),
  new PVector(903.0,515.0),
  new PVector(850.0,594.0),
  new PVector(763.0,647.0),
  new PVector(670.0,669.0),
  new PVector(672.0,706.0),
  new PVector(772.0,682.0),
  new PVector(878.0,613.0),
  new PVector(933.0,531.0),
  new PVector(966.0,416.0),
  new PVector(951.0,300.0),
  new PVector(901.0,202.0),
  new PVector(823.0,130.0),
  new PVector(709.0,81.0),
  new PVector(585.0,76.0),
  new PVector(487.0,111.0),
  new PVector(406.0,171.0),
  new PVector(345.0,248.0),
  new PVector(315.0,343.0),
  new PVector(316.0,455.0),
  new PVector(351.0,539.0),
  new PVector(408.0,606.0),
  new PVector(480.0,648.0),
  new PVector(567.0,672.0),
  new PVector(566.0,707.0),
  new PVector(461.0,682.0),
  new PVector(380.0,630.0),
  new PVector(318.0,558.0),
  new PVector(281.0,461.0),
  new PVector(278.0,341.0),
  new PVector(310.0,235.0),
  new PVector(375.0,143.0),
  new PVector(470.0,74.0),
  new PVector(581.0,38.0),
  new PVector(716.0,40.0),
  new PVector(841.0,94.0),
  new PVector(926.0,177.0),
  new PVector(985.0,290.0),
  new PVector(1002.0,414.0),
  new PVector(970.0,546.0),
  new PVector(901.0,641.0),
  new PVector(784.0,718.0),
  new PVector(672.0,742.0)
};
