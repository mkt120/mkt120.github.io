<template>
    <footer>
        <div class="footer-container">
            <figure class="image"><img src="/asset/text.png" alt=""></figure>
            <div class="text-containter">
                <p>どうも。どっことです。</p>
                <p>創りたいものを創りたいように作っています。</p>
                <ul class="sns-container">
                    <li class="sns-list-item"><a href="https://github.com/mkt120">GitHub</a></li>
                    <li class="sns-list-item">Twitter</li>
                    <li class="sns-list-item">Zenn</li>
                    <li class="sns-list-item">AtCoder</li>
                </ul>
            </div>
        </div>
    </footer>
</template>

<style>
.footer-container {
    /*横並び*/
    display: flex;
    margin-top: 100px;
    margin-bottom: 100px;

    p {
        font-size: 16px;
        color: gray;
    }

    .image {
        /*画像サイズ指定*/
        width: 100px;
        margin: 0;
        padding: 0;
    }

    .image img {
        width: 100%;
        height: auto;
    }

    .text-containter {
        margin-left: 20px;

        p {
            margin: 0;
        }
    }
    .sns-container {
        padding-left: 0px;
        display: flex;
        list-style: none;
        .sns-list-item {
            padding: 8px;
        }
    }
}
</style>