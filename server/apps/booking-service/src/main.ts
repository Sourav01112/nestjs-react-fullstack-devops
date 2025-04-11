import { NestFactory } from '@nestjs/core';
import * as ip from 'ip';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

const localIp = ip.address();

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(new ValidationPipe());
  app.enableCors({
    origin: ['http://localhost:3000', 'https://yourfrontend.com'],
  });
  let port = process.env.PORT || 8001;
  await app.listen(port);

  console.log(`🚀 BOOKING Server is running on ${localIp} at port - ${port})`)
}
bootstrap();
