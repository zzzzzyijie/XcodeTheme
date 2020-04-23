//
//  JZCyclePagerView.m
//  TYCyclePagerViewDemo
//
//  Created by Jie on 2020/4/14.
//  Copyright © 2020 tany. All rights reserved.
//

#import "JZCyclePagerView.h"
#import <TYCyclePagerView/TYCyclePagerView.h>
#import <TYCyclePagerView/TYPageControl.h>

@interface JZCyclePagerView ()
<
TYCyclePagerViewDataSource,
TYCyclePagerViewDelegate
>
@property (nonatomic,strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;
@end

@implementation JZCyclePagerView

- (instancetype)initWithImageUrls:(NSArray<NSString *> *)imageUrls {
    if (self = [super init]) {
        self.controlPositon = center;
        self.isInfiniteLoop = YES;
        self.imageUrls = imageUrls;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.pagerView];
    [self addSubview:self.pageControl];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self resizeLayout];
}

- (void)setControlPositon:(PageControlPositon)controlPositon {
    _controlPositon = controlPositon;
    [self resizeLayout];
}

- (void)setIsInfiniteLoop:(BOOL)isInfiniteLoop {
    self.pagerView.isInfiniteLoop = isInfiniteLoop;
}

- (void)setImageUrls:(NSArray<NSString *> *)imageUrls {
    if(!imageUrls) {return;}
    self.pageControl.numberOfPages = imageUrls.count;
    if (imageUrls.count <= 1) {
        self.pagerView.isInfiniteLoop = NO;
    }
    _imageUrls = imageUrls;
    [self resizeLayout];
    [self.pagerView reloadData];
}

- (void)resizeLayout {
    NSInteger imageCount = self.imageUrls.count;
    self.pagerView.frame = self.bounds;
    CGFloat pageY = CGRectGetHeight(self.pagerView.bounds) - 25.f;
    CGFloat pageW = imageCount > 0 ? (imageCount * (8+5) + 10):(0);
    CGFloat pageH = 26;
    CGFloat pageX = 0.0f;
    switch (self.controlPositon) {
        case left:
            pageX = 20.0f;
            break;
        case center:
            pageX = (CGRectGetWidth(self.pagerView.bounds) - pageW) * 0.5;
            break;
        case right:
            pageX = (CGRectGetWidth(self.pagerView.bounds) - pageW) - 20;
            break;
    }
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
}

#pragma mark - ============== Delegate  ============
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return self.imageUrls.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    JZCycleCollectionCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
    //cell.backgroundColor = UIColor.grayColor;
    NSString *url = self.imageUrls[index];
    [cell.contentImageView jz_setImageWithUrl:url placeholderImage:nil];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame), CGRectGetHeight(pageView.frame));
    //layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    //layout.itemSpacing = 10;
    //layout.minimumAlpha = 0.3;
    //layout.itemHorizontalCenter = YES;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
    //NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

#pragma mark - ============== Lazy ============
- (TYCyclePagerView *)pagerView {
    if (!_pagerView) {
        TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]init];
        pagerView.layer.borderWidth = 1;
        pagerView.isInfiniteLoop = YES;
        pagerView.autoScrollInterval = 3.0;
        pagerView.dataSource = self;
        pagerView.delegate = self;
        pagerView.layout.layoutType = TYCyclePagerTransformLayoutLinear;
        // registerClass or registerNib
        [pagerView registerClass:[JZCycleCollectionCell class] forCellWithReuseIdentifier:@"cellId"];
        _pagerView = pagerView;
    }
    return _pagerView;
}

- (TYPageControl *)pageControl {
    if (!_pageControl) {
        TYPageControl *pageControl = [[TYPageControl alloc]init];
        pageControl.numberOfPages = self.imageUrls.count;
        pageControl.pageIndicatorSpaing = 5;
        pageControl.currentPageIndicatorSize = CGSizeMake(14, 3);
        pageControl.pageIndicatorSize = CGSizeMake(8, 3);
        pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        pageControl.pageIndicatorTintColor = [UIColor redColor];
    //    pageControl.pageIndicatorImage = [UIImage imageNamed:@"Dot"];
    //    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"DotSelected"];
    //    pageControl.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    //    pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //    pageControl.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//        [_pagerView addSubview:pageControl];
        _pageControl = pageControl;
    }
    return _pageControl;
}

@end


@implementation JZCycleCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.contentImageView = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            [self.contentView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            }];
            imageView;
        });
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
