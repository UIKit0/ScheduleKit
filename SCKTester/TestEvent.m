//
//  TestEvent.m
//  ScheduleKit
//
//  Created by Guillem on 14/1/15.
//  Copyright (c) 2015 Guillem Servera. All rights reserved.
//

#import "TestEvent.h"

@implementation TestEvent

- (instancetype)initWithType:(SCKEventType)type user:(id <SCKUser>)user patient:(id)patient title:(NSString*)title duration:(NSInteger)duration date:(NSDate*)date {
    self = [super init];
    if (self) {
        _eventType = type;
        _user = user;
        _patient = patient;
        _title = title;
        _duration = @(duration);
        _scheduledDate = date;
    }
    return self;
}

+ (NSArray*)sampleEvents:(NSArray*)userArray {
    NSMutableArray *array = [NSMutableArray new];
    
    id <SCKUser> user1 = userArray[0];
    id <SCKUser> user2 = userArray[1];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal components:NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *dayBeforeComps = [[NSDateComponents alloc] init];
    dayBeforeComps.day = -1;
    dayBeforeComps.hour = 1;
    
    NSDateComponents *weekAfterComps = [[NSDateComponents alloc] init];
    weekAfterComps.day = 6;
    weekAfterComps.hour = -1;
    comps.hour = 9;
    
    [array addObject:[[self alloc] initWithType:SCKEventTypeDefault user:user1 patient:nil title:@"Evento 1" duration:60 date:[cal dateFromComponents:comps]]];
    [array addObject:[[self alloc] initWithType:SCKEventTypeDefault user:user1 patient:nil title:@"Evento 11" duration:60 date:[cal dateFromComponents:comps]]];
    [array addObject:[[self alloc] initWithType:SCKEventTypeSession user:user2 patient:nil title:@"Evento 12" duration:60 date:[cal dateFromComponents:comps]]];
    comps.hour = 10;
    [array addObject:[[self alloc] initWithType:SCKEventTypeSurgery user:user1 patient:nil title:@"Evento 2" duration:60 date:[cal dateFromComponents:comps]]];
    [array addObject:[[self alloc] initWithType:SCKEventTypeSession user:user2 patient:nil title:@"Evento 3" duration:60 date:[cal dateFromComponents:comps]]];
    comps.hour = 12;
    [array addObject:[[self alloc] initWithType:SCKEventTypeDefault user:user1 patient:nil title:@"Evento 4" duration:60 date:[cal dateFromComponents:comps]]];
    [array addObject:[[self alloc] initWithType:SCKEventTypeSurgery user:user1 patient:nil title:@"Evento 13" duration:60 date:[cal dateFromComponents:comps]]];
    [array addObject:[[self alloc] initWithType:SCKEventTypeDefault user:user1 patient:nil title:@"Evento 14" duration:60 date:[cal dateFromComponents:comps]]];
    comps.hour = 14;
    [array addObject:[[self alloc] initWithType:SCKEventTypeDefault user:user1 patient:nil title:@"Evento 5" duration:60 date:[cal dateFromComponents:comps]]];
    [array addObject:[[self alloc] initWithType:SCKEventTypeSession user:user2 patient:nil title:@"Evento 6" duration:60 date:[cal dateFromComponents:comps]]];
    [array addObject:[[self alloc] initWithType:SCKEventTypeDefault user:user1 patient:nil title:@"Evento 7" duration:60 date:[cal dateFromComponents:comps]]];
    comps.minute = 30;
    [array addObject:[[self alloc] initWithType:SCKEventTypeSession user:user2 patient:nil title:@"Evento 8" duration:60 date:[cal dateFromComponents:comps]]];
    comps.minute = 0;
    comps.hour = 16;
    [array addObject:[[self alloc] initWithType:SCKEventTypeDefault user:user1 patient:nil title:@"Evento 9" duration:60 date:[cal dateFromComponents:comps]]];
    comps.hour = 17;
    [array addObject:[[self alloc] initWithType:SCKEventTypeSurgery user:user2 patient:nil title:@"Evento 10" duration:60 date:[cal dateFromComponents:comps]]];
    
    
    return array;
}


@end
