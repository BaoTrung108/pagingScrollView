//
//  ViewController.m
//  pagingScrollView
//
//  Created by trung bao on 12/12/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"
#define photo_width 320
#define photo_height 480
#define photo_number 5

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController
{
    UIScrollView* scrollView;
    UIPageControl* pageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGSize size = self.view.bounds.size;
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((size.width - photo_width) * 0.5, (size.height - photo_height) * 0.5, photo_width , photo_height)];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.contentSize = CGSizeMake(photo_width * photo_number, photo_height);
    scrollView.pagingEnabled = YES;
    for ( int i = 1 ; i < 6; i++) {
        NSString* name = [NSString stringWithFormat:@"images%d",i];
        UIImage* image = [UIImage imageNamed:name];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake((i - 1) * photo_width, 0, photo_width, photo_height);
        [scrollView addSubview:imageView];
    }
    [self.view addSubview:scrollView];
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, (size.height - 40), size.width, 40)];
    pageControl.backgroundColor = [UIColor grayColor];
    pageControl.numberOfPages = photo_number;
    [pageControl addTarget:self
                    action:@selector(onPageControl)
          forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) onPageControl {
    scrollView.contentOffset = CGPointMake (photo_width * pageControl.currentPage, 0);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    pageControl.currentPage = scrollView.contentOffset.x / photo_width;
}

@end
