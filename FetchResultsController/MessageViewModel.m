//
//  MessageViewModel.m
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/5.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import "MessageViewModel.h"
#import "UIMessageTableViewCell.h"
@interface MessageViewModel ()

@end

@implementation MessageViewModel

- (instancetype)init
{
    if (self = [super init]) {
        [self initialBind];
    }
    return self;
    
}

- (void)initialBind
{
    
}

#pragma mark   UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.fetchResultsController sections].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sessionInfo = [[self.fetchResultsController sections] objectAtIndex:section];
    
    return [sessionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell = [cell initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    Bird *bird = [self.fetchResultsController objectAtIndexPath:indexPath];

//    cell.textLabel.text = bird.fly;
//    cell.detailTextLabel.text = bird.feed;
    UIMessageTableViewCell *cell = [UIMessageTableViewCell cellWithTableView:tableView atBird:bird];
    
    return cell;
}


#pragma mark --NSFetchResultsControllerDelegate
//
//- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
//{
//    [self.tableView beginUpdates];
//}
//
//- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
//{
//    [self.tableView endUpdates];
//    
//}
//
//- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
//    
//    switch (type) {
//        case NSFetchedResultsChangeInsert:
//            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//        case NSFetchedResultsChangeDelete:
//            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
//        default:
//            break;
//    }
//    
//}
//- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
//    
//    switch (type) {
//        case NSFetchedResultsChangeInsert:
//            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
//            
//            break;
//        case NSFetchedResultsChangeDelete:
//            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            
//            break;
//        case NSFetchedResultsChangeMove:{
//            
//            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
//            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            
//            //[self.tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
//        }
//            
//            
//            break;
//        case NSFetchedResultsChangeUpdate:
//        {
//            
//            
//            Bird *birdSession = [self.fetchResultsController objectAtIndexPath:indexPath];
//            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//            cell.textLabel.text = birdSession.feed;
//            cell.detailTextLabel.text = birdSession.fly;
//            
//        }
//            break;
//        default:
//            break;
//    }
//    
//}
@end
