/* Copyright 2016 Esteve Fernandez <esteve@apache.org>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <Foundation/Foundation.h>

#import <ROS_std_msgs/msg/String.h>
#import <rclobjc/ROSRCLObjC.h>

int main() {
  [ROSRCLObjC rclInit];
  ROSNode *node = [ROSRCLObjC createNode:@"talker"];

  ROSPublisher<ROS_std_msgs_msg_String *> *publisher =
      [node createPublisher:[ROS_std_msgs_msg_String class]:@"chatter"];

  ROS_std_msgs_msg_String *msg = [[ROS_std_msgs_msg_String alloc] init];
  int i = 1;

  while ([ROSRCLObjC ok]) {
    [msg setData:[NSString stringWithFormat:@"Hello World: %d", i]];
    i++;
    NSLog(@"%@\n", [NSString stringWithFormat:@"Publishing: '%@'", [msg data]]);
    [publisher publish:msg];
    [NSThread sleepForTimeInterval:1.0f];
  }
  NSLog(@"Hello World!\n");
  return 0;
}
