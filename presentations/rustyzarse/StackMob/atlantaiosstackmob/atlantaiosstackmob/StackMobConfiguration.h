// Copyright 2011 StackMob, Inc
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#if DEBUG
#define SMLog(format, ...) {NSLog(format, ##__VA_ARGS__);}
#define StackMobDebug(format, ...) {NSLog([[NSString stringWithFormat:@"[%s, %@, %d] ", __PRETTY_FUNCTION__, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__] stringByAppendingFormat:format, ##__VA_ARGS__]);}
#else
#define SMLog(format, ...) {NSLog(format, ##__VA_ARGS__);}
#define StackMobDebug(format, ...) {NSLog([[NSString stringWithFormat:@"[%s, %@, %d] ", __PRETTY_FUNCTION__, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__] stringByAppendingFormat:format, ##__VA_ARGS__]);}
#endif


#define STACKMOB_PUBLIC_KEY         @"a2d64823-18fd-4bd9-8b49-58953f91a908"
#define STACKMOB_PRIVATE_KEY        @"e66629a9-b766-45e6-bab3-1dc8105b39b6"
#define STACKMOB_APP_NAME           @"atlantaios"
#define STACKMOB_APP_SUBDOMAIN      @"levous"
#define STACKMOB_APP_DOMAIN         @"stackmob.com" 
#define STACKMOB_USER_OBJECT_NAME   @"user" 
#define STACKMOB_API_VERSION        0   // 0 for Development, 1+ for Production versions