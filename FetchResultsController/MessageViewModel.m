//
//  MessageViewModel.m
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/5.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import "MessageViewModel.h"

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
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
////- (Bird *)bird
////{
////    if (!_bird) {
////        _bird = [Bird MR_createEntity];
////    }
////    return _bird;
////}
//
//
//- (NSFetchedResultsController *)fetchResultsController
//{
//    if (nil != _fetchResultsController) {
//        return _fetchResultsController;
//    }
//    
//    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
//    
//    if (context == nil) {
//        return nil;
//    }
//    
//    NSFetchRequest *fetchRequest = [Bird MR_requestAllSortedBy:@"feed" ascending:NO];
//    [fetchRequest setFetchBatchSize:20];
//    [fetchRequest setFetchLimit:100];
//    NSString *strCacheName = [NSString stringWithFormat:@"SessionMessage"];
//    
//    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:strCacheName];
//  
//    _fetchResultsController = fetchedResultsController;
//    
//    NSError *error = nil;
//    
//    [NSFetchedResultsController deleteCacheWithName:strCacheName];
//    
//    if (![_fetchResultsController performFetch:&error]) {
//        
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        
//        abort();
//    }
//    
//    return _fetchResultsController;
//}

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [cell initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    Bird *bird = [self.fetchResultsController objectAtIndexPath:indexPath];

    cell.textLabel.text = bird.fly;
    cell.detailTextLabel.text = bird.feed;
  
    
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
